import 'dart:convert';
import 'dart:mirrors';
import 'package:api/config/connection_config.dart';
import 'package:api/models/dto/base_dto.dart';
import 'package:api/models/entity/base_entity.dart';
import 'package:api/utils/utils.dart';

abstract class BaseRepository {
  final ConnectionConfig _connection = ConnectionConfig();
  late String _tableName;
  BaseEntity? _entity;
  BaseDto? _dto;
  late String _sqlFind;
  late bool _existsWhere;
  late String _aliasTable;
  // ignore: constant_identifier_names
  static const RESULT_FILTER_SQL = '#RESULT_FILTER_SQL#';

  void instanceEntity();

  void instanceDto();

  String sqlFind();

  String aliasTable();

  BaseRepository() {
    instanceEntity();
    instanceDto();

    _sqlFind = sqlFind();
    _aliasTable = aliasTable();
  }

  // ignore: unnecessary_getters_setters
  BaseEntity get entity {
    return _entity!;
  }

  set entity(BaseEntity entity) {
    _entity = entity;
  }

  // ignore: unnecessary_getters_setters
  BaseDto get dto {
    return _dto!;
  }

  set dto(BaseDto dto) {
    _dto = dto;
  }

  String resultFilterSql([bool existsWhere = false]) {
    _existsWhere = existsWhere;

    return RESULT_FILTER_SQL;
  }

  void _setFieldsInList(Map<String, Map<String, dynamic>> row, Object object) {
    InstanceMirror myClassMirror = reflect(object);

    for (var obj in row.entries) {
      for (var m in obj.value.entries) {
        myClassMirror.setField(
            Symbol(Utils.getNameTableFieldToConvetedClass(m.key)), m.value);
      }
    }
  }

  void _setFieldInMapInsert(Map<String, dynamic> map,
      InstanceMirror myClassMirror, ClassMirror classMirror) {
    for (var m in classMirror.declarations.values) {
      if ((m is MethodMirror) && (m.isGetter)) {
        String field = MirrorSystem.getName(m.simpleName).replaceAll("=", "");

        final conteudo = <String, dynamic>{
          Utils.getNameConvetedClassToTableField(field, ""):
              myClassMirror.getField(Symbol(field)).reflectee,
        };

        map.addEntries(conteudo.entries);
      }
    }
  }

  void _setValuesInEntity(
      Map map, InstanceMirror myClassMirror, ClassMirror classMirror) {
    for (var m in classMirror.declarations.values) {
      if ((m is MethodMirror) && (m.isSetter)) {
        myClassMirror.setField(
            Symbol(MirrorSystem.getName(m.simpleName).replaceAll("=", "")),
            map[MirrorSystem.getName(m.simpleName).replaceAll("=", "")]);
      }
    }
  }

  Future<void> post(String json) async {
    InstanceMirror myClassMirror = reflect(_entity);
    ClassMirror myClassType = myClassMirror.type;
    final objJson = jsonDecode(json);
    Map<String, dynamic> map = {};

    _tableName = Utils.getNameConvetedClassToTableField(
        MirrorSystem.getName(myClassMirror.type.simpleName), "Entity");

    _setValuesInEntity(objJson, myClassMirror, myClassType);
    _setFieldInMapInsert(map, myClassMirror, myClassType);

    String rows = map.keys.toString();
    String rowsName = rows.replaceAll("(", "(@");
    rowsName = rowsName.replaceAll(" ", " @");

    await _connection.query(
        "INSERT INTO " + _tableName + " " + rows + " VALUES " + rowsName + " ",
        substitutionValues: map);
  }

  Future<void> put(String json) async {
    InstanceMirror myClassMirror = reflect(_entity);
    ClassMirror myClassType = myClassMirror.type;
    ClassMirror? superClassMirror = myClassType.superclass;
    final objJson = jsonDecode(json);
    Map<String, dynamic> map = {};

    _tableName = Utils.getNameConvetedClassToTableField(
        MirrorSystem.getName(myClassMirror.type.simpleName), "Entity");

    _setValuesInEntity(objJson, myClassMirror, myClassType);
    _setValuesInEntity(objJson, myClassMirror, superClassMirror!);
    _setFieldInMapInsert(map, myClassMirror, myClassType);

    String rows = map.keys.toString();
    String rowsName = rows.replaceAll("(", "(@");
    rowsName = rowsName.replaceAll(" ", " @");

    await _connection.query(
        "UPDATE " +
            _tableName +
            " SET " +
            rows +
            " = " +
            rowsName +
            " WHERE id = " +
            _entity!.id.toString(),
        substitutionValues: map);
  }

  Future<void> deleteById(int id) async {
    if (_entity != null) {
      InstanceMirror myClassMirror = reflect(_entity);
      _tableName = Utils.getNameConvetedClassToTableField(
          MirrorSystem.getName(myClassMirror.type.simpleName), "Entity");
    }

    String sql = "delete from " + _tableName + " where id =" + id.toString();

    await _connection.query(sql);
  }

  Future<BaseDto> findById(int id) async {
    if (_dto != null) {
      InstanceMirror myClassMirror = reflect(_dto);
      _tableName = Utils.getNameConvetedClassToTableField(
          MirrorSystem.getName(myClassMirror.type.simpleName), "Dto");
    }

    if (_existsWhere) {
      _sqlFind = _sqlFind.replaceAll(
          RESULT_FILTER_SQL, ' and ' + _aliasTable + '.id = ' + id.toString());
    } else {
      _sqlFind = _sqlFind.replaceAll(RESULT_FILTER_SQL,
          ' where ' + _aliasTable + '.id = ' + id.toString());
    }

    await _connection.queryFind(_sqlFind).then((value) {
      for (final row in value) {
        instanceDto();

        _setFieldsInList(row, _dto!);
      }
    });

    return _dto!;
  }

  Future<List<BaseDto>> findAll() async {
    List<BaseDto> lista = List<BaseDto>.empty(growable: true);

    if (_dto != null) {
      InstanceMirror myClassMirror = reflect(_dto);
      _tableName = Utils.getNameConvetedClassToTableField(
          MirrorSystem.getName(myClassMirror.type.simpleName), "Dto");
    }

    _sqlFind = _sqlFind.replaceAll(RESULT_FILTER_SQL, '');

    await _connection.queryFind(_sqlFind).then((value) {
      for (final row in value) {
        instanceDto();

        _setFieldsInList(row, _dto!);

        lista.add(_dto!);
      }
    });

    return lista;
  }
}
