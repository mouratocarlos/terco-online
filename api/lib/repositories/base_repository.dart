import 'dart:convert';
import 'package:api/config/connection_config.dart';
import 'package:api/models/dto/base_dto.dart';
import 'package:api/models/entity/base_entity.dart';
import 'package:api/utils/utils.dart';
import 'package:dartnate/annotations/column.dart';
import 'package:dartnate/annotations/not_empty.dart';
import 'package:dartnate/annotations/not_null.dart';
import 'package:dartnate/annotations/table.dart';
import 'package:dartnate/annotations/transient.dart';
import 'package:reflectable/mirrors.dart';

abstract class BaseRepository {
  final ConnectionConfig _connection = ConnectionConfig();
  // ignore: constant_identifier_names
  static const RESULT_FILTER_SQL = '#RESULT_FILTER_SQL#';
  late String _tableName;
  late String _sqlFind;
  late bool _existsWhere;
  late String _aliasTable;
  late InstanceMirror _myClassMirror;
  late ClassMirror _myClassType;
  late ClassMirror _superClassMirror;
  BaseEntity? _entity;
  BaseDto? _dto;

  void instanceEntity();

  void instanceDto();

  String sqlFind();

  String aliasTable();

  BaseRepository() {
    instanceEntity();
    instanceDto();

    _sqlFind = sqlFind();
    _aliasTable = aliasTable();

    _myClassMirror = reflect(_entity);
    _myClassType = _myClassMirror.type;
    _superClassMirror = _myClassType.superclass!;

    _setTableName();
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

  void _setTableName() {
    Object? obj = Utils.getAnnotation(_myClassType, Table);

    if (!(obj == null)) {
      _tableName = (obj as Table).name;
    } else {
      _tableName = Utils.getNameConvetedClassToTableField(
          MirrorSystem.getName(_myClassMirror.type.simpleName), "Entity");
    }
  }

  void _consistPropertiesTable(ClassMirror classType) {
    for (var m in classType.declarations.values) {
      Object? column = Utils.getAnnotation(m, Column);
      Object? notNull = Utils.getAnnotation(m, NotNull);
      Object? notEmpty = Utils.getAnnotation(m, NotEmpty);
      Object? transient = Utils.getAnnotation(m, Transient);
      dynamic value;

      if ((!(transient == null)) && (transient is Transient)) {
        continue;
      }

      String field = m.simpleName
          .toString()
          .replaceAll('Symbol("_', '')
          .replaceAll('")', '');

      try {
        value = _myClassMirror.getField(Symbol(field)).reflectee;
      } catch (_) {
        continue;
      }

      if ((!(column == null)) && (column is Column)) {
        if (column.length != null) {
          if (value is String) {
            if (((value).length > column.length!)) {
              throw Exception([
                "Campo ${column.name} com tamanho maior que ${column.length}"
              ]);
            }
          } else if (value is int) {
            if (((value).toString().length > column.length!)) {
              throw Exception([
                "Campo ${column.name} com tamanho maior que ${column.length}"
              ]);
            }
          }
        } else if (column.nullable) {
          if ((_myClassMirror.getField(Symbol(field)).reflectee == null)) {
            throw Exception(["${column.name} não pode estar vazio"]);
          }
        }
      }

      if ((!(notNull == null)) && (notNull is NotNull)) {
        if (value == null) {
          throw Exception([notNull.message ?? "Não pode estar nulo"]);
        }
      }

      if ((!(notEmpty == null)) && (notEmpty is NotEmpty)) {
        if ((value is String)) {
          if (value.isEmpty) {
            throw Exception([notEmpty.message ?? "Não pode estar vazio"]);
          }
        }
      }
    }
  }

  String resultFilterSql([bool existsWhere = false]) {
    _existsWhere = existsWhere;

    return RESULT_FILTER_SQL;
  }

  Future<void> post(String json) async {
    final objJson = jsonDecode(json);
    Map<String, dynamic> map = {};

    Utils.setValuesInEntity(objJson, _myClassMirror, _myClassType);
    Utils.setFieldInMapInsert(map, _myClassMirror, _myClassType);

    _consistPropertiesTable(_myClassType);

    String rows = map.keys.toString();
    String rowsName = rows.replaceAll("(", "(@");
    rowsName = rowsName.replaceAll(" ", " @");

    await _connection.query(
        "INSERT INTO " + _tableName + " " + rows + " VALUES " + rowsName + " ",
        substitutionValues: map);
  }

  Future<void> put(String json) async {
    final objJson = jsonDecode(json);
    Map<String, dynamic> map = {};

    Utils.setValuesInEntity(objJson, _myClassMirror, _myClassType);
    Utils.setValuesInEntity(objJson, _myClassMirror, _superClassMirror);
    Utils.setFieldInMapInsert(map, _myClassMirror, _myClassType);

    _consistPropertiesTable(_myClassType);
    _consistPropertiesTable(_superClassMirror);

    String rows = map.keys.toString();
    String rowsName = rows.replaceAll("(", "(@");
    rowsName = rowsName.replaceAll(" ", " @");

    String sqlPut = "UPDATE " +
        _tableName +
        " SET " +
        rows +
        " = " +
        rowsName +
        " WHERE id = " +
        _entity!.id.toString();

    await _connection.query(sqlPut, substitutionValues: map);
  }

  Future<void> deleteById(int id) async {
    String sql = "delete from " + _tableName + " where id =" + id.toString();

    await _connection.query(sql);
  }

  Future<BaseDto> findById(int id) async {
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

        Utils.setFieldsInList(row, _dto!);
      }
    });

    return _dto!;
  }

  Future<List<BaseDto>> findAll() async {
    List<BaseDto> lista = List<BaseDto>.empty(growable: true);

    _sqlFind = _sqlFind.replaceAll(RESULT_FILTER_SQL, '');

    await _connection.queryFind(_sqlFind).then((value) {
      for (final row in value) {
        instanceDto();

        Utils.setFieldsInList(row, _dto!);

        lista.add(_dto!);
      }
    });

    return lista;
  }
}
