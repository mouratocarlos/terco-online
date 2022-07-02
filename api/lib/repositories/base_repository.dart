import 'dart:mirrors';
import 'package:api/config/connection_config.dart';
import 'package:api/models/entity/base_entity.dart';
import 'package:api/utils/utils.dart';

abstract class BaseRepository {
  final ConnectionConfig _connection = ConnectionConfig();
  late String _tableName;
  BaseEntity? _entity;

  BaseRepository() {
    instanceEntity();
  }

  set entity(BaseEntity entity) {
    _entity = entity;
  }

  // ignore: unnecessary_getters_setters
  BaseEntity get entity {
    return _entity!;
  }

  void instanceEntity();

  void _setFieldsInList(ClassMirror classMirror, InstanceMirror myClassMirror,
      Map<String, Map<String, dynamic>> row) {
    for (var m in classMirror.declarations.values) {
      if ((m is MethodMirror) && (m.isSetter)) {
        myClassMirror.setField(
            Symbol(MirrorSystem.getName(m.simpleName).replaceAll("=", "")),
            row[_tableName]?[Utils.getNameConvetedClassToTableField(
                MirrorSystem.getName(m.simpleName), "=")]);
      }
    }
  }

  void post(BaseEntity entity);

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

        InstanceMirror myClassMirror = reflect(_entity);
        ClassMirror myClassType = myClassMirror.type;
        ClassMirror? superClassMirror = myClassType.superclass;

        _setFieldsInList(myClassType, myClassMirror, row);
        _setFieldsInList(superClassMirror!, myClassMirror, row);
      }
    });

    return _entity!;
  }

  Future<List<BaseEntity>> findAll() async {
    List<BaseEntity> lista = List<BaseEntity>.empty(growable: true);

    if (_entity != null) {
      InstanceMirror myClassMirror = reflect(_entity);
      _tableName = Utils.getNameConvetedClassToTableField(
          MirrorSystem.getName(myClassMirror.type.simpleName), "Entity");
    }

    String sql = "select * from " + _tableName;

    await _connection.queryFind(sql).then((value) {
      for (final row in value) {
        instanceEntity();

        InstanceMirror myClassMirror = reflect(_entity);
        ClassMirror myClassType = myClassMirror.type;
        ClassMirror? superClassMirror = myClassType.superclass;

        _setFieldsInList(myClassType, myClassMirror, row);
        _setFieldsInList(superClassMirror!, myClassMirror, row);

        lista.add(_entity!);
      }
    });

    return lista;
  }
}
