import 'package:api/config/connection_config.dart';
import 'package:api/models/entity/base_entity.dart';
import 'package:api/models/entity/oracao_entity.dart';
import 'package:api/repositories/base_repository.dart';

class OracaoRepository extends BaseRepository {
  @override
  void instanceEntity() {
    entity = OracaoEntity.b();
  }

  @override
  void post(BaseEntity entity) async {
    ConnectionConfig _connection = ConnectionConfig();
    OracaoEntity _oracao = (entity as OracaoEntity);

    await _connection.query(
      "INSERT INTO oracao (texto) VALUES (@oracao)",
      substitutionValues: {
        "texto": _oracao.texto,
      },
    );
  }
}
