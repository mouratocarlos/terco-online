import 'package:api/config/connection_config.dart';
import 'package:api/models/dto/terco_dto.dart';
import 'package:api/models/entity/base_entity.dart';
import 'package:api/models/entity/terco_entity.dart';
import 'package:api/repositories/base_repository.dart';

class TercoRepository extends BaseRepository {
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

  @override
  Future<List<TercoDto>> findAll() async {
    ConnectionConfig _connection = ConnectionConfig();
    List<TercoDto> _lista = List<TercoDto>.empty(growable: true);

    String _sql = "select TER.id, " +
        "TER.descricao as DESCRICAO_TERCO, " +
        "(select ORA.texto from oracao ORA where ORA.id = TER.id_oracao_bolinha_ave_maria) as ORACAO_BOLINHA_AVE_MARIA, " +
        "(select ORA.texto from oracao ORA where ORA.id = TER.id_oracao_bolinha_pai_nosso) as ORACAO_BOLINHA_PAI_NOSSO " +
        "from terco TER ";

    await _connection.queryFind(_sql).then((value) {
      for (final row in value) {
        TercoDto _terco = TercoDto(
          row["terco"]?["id"],
          row["terco"]?["descricao_terco"],
          row[""]?["oracao_bolinha_ave_maria"],
          row[""]?["oracao_bolinha_pai_nosso"],
        );
        _lista.add(_terco);
      }
    });

    return _lista;
  }

  @override
  Future<TercoDto> findById(int id) async {
    ConnectionConfig _connection = ConnectionConfig();
    TercoDto _terco = TercoDto(0, "", "", "");

    String _sql = "select TER.id, " +
        "TER.descricao as DESCRICAO_TERCO, " +
        "(select ORA.texto from oracao ORA where ORA.id = TER.id_oracao_bolinha_ave_maria) as ORACAO_BOLINHA_AVE_MARIA, " +
        "(select ORA.texto from oracao ORA where ORA.id = TER.id_oracao_bolinha_pai_nosso) as ORACAO_BOLINHA_PAI_NOSSO " +
        "from terco TER " +
        "where TER.id = " +
        id.toString();

    await _connection.queryFind(_sql).then((value) {
      for (final row in value) {
        _terco = TercoDto(
          row["terco"]?["id"],
          row["terco"]?["descricao_terco"],
          row[""]?["oracao_bolinha_ave_maria"],
          row[""]?["oracao_bolinha_pai_nosso"],
        );
      }
    });

    return _terco;
  }
}
