import 'dart:mirrors';

import 'package:api/config/connection_config.dart';
import 'package:api/models/entity/base_entity.dart';
import 'package:api/utils/utils.dart';

abstract class BaseRepository {
  final ConnectionConfig _connection = ConnectionConfig();
  late String _tableName;
  late BaseEntity _entity;

  BaseRepository() {
    instanceEntity();
  }

  void instanceEntity();

  set entity(BaseEntity entity) {
    _entity = entity;
  }

  // ignore: unnecessary_getters_setters
  BaseEntity get entity {
    return _entity;
  }

  void post(BaseEntity entity);

  Future<BaseEntity> findById(int id);

  // Future<List<BaseEntity>> findAll();
  Future<List<BaseEntity>> findAll() async {
    if (_entity != null) {
      InstanceMirror _MyClassMirror = reflect(_entity);
      _tableName = Utils.getNameConvetedClassToTableField(
          MirrorSystem.getName(_MyClassMirror.type.simpleName), "Entity");
    }

    List<BaseEntity> _lista = List<BaseEntity>.empty(growable: true);
    String _sql = "select * from " + _tableName;

    await _connection.queryFind(_sql).then((value) {
      for (final row in value) {
        instanceEntity();
        InstanceMirror _MyClassMirror = reflect(_entity);
        ClassMirror _MyClassType = _MyClassMirror.type;

        for (var m in _MyClassType.declarations.values) {
          if ((m is MethodMirror) && (m.isSetter)) {
            print(m.simpleName);
            print(Utils.getNameConvetedClassToTableField(
                MirrorSystem.getName(m.simpleName), "="));
            print(row[_tableName]?[Utils.getNameConvetedClassToTableField(
                MirrorSystem.getName(m.simpleName), "=")]);
            _MyClassMirror.setField(
                Symbol(MirrorSystem.getName(m.simpleName).replaceAll("=", "")),
                row[_tableName]?[Utils.getNameConvetedClassToTableField(
                    MirrorSystem.getName(m.simpleName), "=")]);
          }
        }

        _entity.id = 0;
        print(_entity);
        _lista.add(_entity);
      }
    });

    print(_lista);
    return _lista;
  }
}
