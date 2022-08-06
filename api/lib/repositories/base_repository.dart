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
  late String _sqlFindAll;

  void instanceEntity();

  void instanceDto();

  String sqlFindAll();

  BaseRepository() {
    instanceEntity();
    instanceDto();
    _sqlFindAll = sqlFindAll();
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

  Future<BaseEntity> findById(int id) async {
    if (_entity != null) {
      InstanceMirror myClassMirror = reflect(_entity);
      _tableName = Utils.getNameConvetedClassToTableField(
          MirrorSystem.getName(myClassMirror.type.simpleName), "Entity");
    }

    String sql = "select * from " + _tableName + " where id =" + id.toString();

    await _connection.queryFind(sql).then((value) {
      for (final row in value) {
        instanceEntity();

        _setFieldsInList(row, _entity!);
      }
    });

    return _entity!;
  }

  Future<List<BaseDto>> findAll() async {
    List<BaseDto> lista = List<BaseDto>.empty(growable: true);

    if (_dto != null) {
      InstanceMirror myClassMirror = reflect(_dto);
      _tableName = Utils.getNameConvetedClassToTableField(
          MirrorSystem.getName(myClassMirror.type.simpleName), "Dto");
    }

    await _connection.queryFind(_sqlFindAll).then((value) {
      for (final row in value) {
        instanceDto();

        _setFieldsInList(row, _dto!);

        lista.add(_dto!);
      }
    });

    return lista;
  }
}
