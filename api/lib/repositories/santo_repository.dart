import 'package:api/config/connection_config.dart';
import 'package:api/models/entity/base_entity.dart';
import 'package:api/models/entity/santo_entity.dart';
import 'package:api/repositories/base_repository.dart';

class SantoRepository extends BaseRepository {
  @override
  void instanceEntity() {
    entity = SantoEntity.b();
  }

  @override
  void post(BaseEntity entity) async {
    ConnectionConfig _connection = ConnectionConfig();
    SantoEntity _santo = (entity as SantoEntity);

    await _connection.query(
      "INSERT INTO santo (mencao, resposta, is_favorito) " +
          "VALUES (@mencao, @resposta, @is_favorito)",
      substitutionValues: {
        "mencao": _santo.mencao,
        "resposta": _santo.resposta,
        "is_favorito": _santo.isFavorito,
      },
    );
  }

  // @override
  // Future<List<SantoEntity>> findAll() async {
  //   ConnectionConfig _connection = ConnectionConfig();
  //   List<SantoEntity> _lista = List<SantoEntity>.empty(growable: true);

  //   String _sql = "select SAN.id, " +
  //       "SAN.mencao, " +
  //       "SAN.resposta, " +
  //       "SAN.is_favorito " +
  //       "from santo SAN ";

  //   await _connection.queryFind(_sql).then((value) {
  //     for (final row in value) {
  //       SantoEntity _santo = SantoEntity(
  //         row["santo"]?["id"],
  //         row["santo"]?["mencao"],
  //         row["santo"]?["resposta"],
  //         row["santo"]?["is_favorito"],
  //       );

  //       _lista.add(_santo);
  //     }
  //   });

  //   return _lista;
  // }

  @override
  Future<SantoEntity> findById(int id) async {
    ConnectionConfig _connection = ConnectionConfig();
    SantoEntity _santo = SantoEntity(0, "", "", false);

    String _sql = "select SAN.id, " +
        "SAN.mencao, " +
        "SAN.resposta, " +
        "SAN.is_favorito " +
        "from santo SAN " +
        "where SAN.id = " +
        id.toString();

    await _connection.queryFind(_sql).then((value) {
      for (final row in value) {
        _santo = SantoEntity(
          row["santo"]?["id"],
          row["santo"]?["mencao"],
          row["santo"]?["resposta"],
          row["santo"]?["is_favorito"],
        );
      }
    });

    return _santo;
  }
}
