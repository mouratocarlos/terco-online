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
}
