import 'dart:ffi';

import 'package:api/config/connection_config.dart';
import 'package:api/models/dto/terco_dto.dart';
import 'package:api/models/entity/terco_entity.dart';
import 'package:api/repositories/base_repository.dart';

class TercoRepository extends BaseRepository {
  void post(TercoEntity terco) async {
    print(terco.descricao);
    print(terco.idOracaoBolinhaAveMaria);
    print(terco.idOracaoBolinhaPaiNosso);

    ConnectionConfig _connection = ConnectionConfig();
    await _connection.query(
      "INSERT INTO terco (descricao, id_oracao_bolinha_pai_nosso, id_oracao_bolinha_ave_maria) VALUES (@descricao, @id_oracao_bolinha_pai_nosso, @id_oracao_bolinha_ave_maria)",
      substitutionValues: {
        "descricao": terco.descricao,
        "id_oracao_bolinha_pai_nosso": terco.idOracaoBolinhaPaiNosso,
        "id_oracao_bolinha_ave_maria": terco.idOracaoBolinhaAveMaria,
      },
    );
  }

  Future<List<TercoDto>> findAll() async {
    ConnectionConfig _connection = ConnectionConfig();
    List<TercoDto> _lista = List<TercoDto>.empty(growable: true);
    String _sql = "select " +
        "TER.descricao as DESCRICAO_TERCO " +
        ", (select " +
        "ORA.texto " +
        "from oracao ORA " +
        "where ORA.id = TER.id_oracao_bolinha_ave_maria) as ORACAO_BOLINHA_AVE_MARIA " +
        ", (select " +
        "ORA.texto " +
        "from oracao ORA " +
        "where ORA.id = TER.id_oracao_bolinha_pai_nosso) as ORACAO_BOLINHA_PAI_NOSSO " +
        "from terco TER ";

    // return await _connection.queryFind(_sql);
    await _connection.queryFind(_sql).then((value) {
      for (final row in value) {
        TercoDto _terco = TercoDto(
          row["terco"]?["descricao_terco"],
          row[""]?["oracao_bolinha_ave_maria"],
          row[""]?["oracao_bolinha_pai_nosso"],
        );
        _lista.add(_terco);
      }
    });

    return _lista;
  }
}
