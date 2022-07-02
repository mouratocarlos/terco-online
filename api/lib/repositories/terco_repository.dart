import 'package:api/config/connection_config.dart';
import 'package:api/models/entity/base_entity.dart';
import 'package:api/models/entity/terco_entity.dart';
import 'package:api/repositories/base_repository.dart';

class TercoRepository extends BaseRepository {
  @override
  void instanceEntity() {
    entity = TercoEntity.b();
  }

  @override
  void post(BaseEntity entity) async {
    ConnectionConfig _connection = ConnectionConfig();
    TercoEntity _terco = (entity as TercoEntity);

    await _connection.query(
      "INSERT INTO terco (descricao, id_oracao_bolinha_pai_nosso, id_oracao_bolinha_ave_maria) " +
          "VALUES (@descricao, @id_oracao_bolinha_pai_nosso, @id_oracao_bolinha_ave_maria)",
      substitutionValues: {
        "descricao": _terco.descricao,
        "id_oracao_bolinha_pai_nosso": _terco.idOracaoBolinhaPaiNosso,
        "id_oracao_bolinha_ave_maria": _terco.idOracaoBolinhaAveMaria,
      },
    );
  }
}
