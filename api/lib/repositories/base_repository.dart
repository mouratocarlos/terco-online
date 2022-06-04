import 'package:api/config/connection_config.dart';
import 'package:api/models/entity/base_entity.dart';

abstract class BaseRepository<T> {
  final ConnectionConfig _connection = ConnectionConfig();

  late BaseEntity _entity;

  BaseEntity getInstanceEntity();

  void post(BaseEntity entity);

  Future<T> findById(int id);

  Future<List<T>> findAll() async {
    List<T> _lista = List<T>.empty(growable: true);

    String _sql = "select * from santo";

    await _connection.queryFind(_sql).then((value) {
      for (final row in value) {
        _entity = getInstanceEntity();
        _entity.id = row["santo"]?["id"];
        row["santo"]?["mencao"];
        row["santo"]?["resposta"];
        row["santo"]?["is_favorito"];

        _lista.add(_entity);
      }
    });

    return _lista;
  }
}
