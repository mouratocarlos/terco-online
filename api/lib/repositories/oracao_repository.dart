import 'package:api/config/connection_config.dart';
import 'package:api/models/entity/base_entity.dart';
import 'package:api/models/entity/oracao_entity.dart';
import 'package:api/repositories/base_repository.dart';

class OracaoRepository extends BaseRepository {
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

  @override
  Future<List<OracaoEntity>> findAll() async {
    ConnectionConfig _connection = ConnectionConfig();
    List<OracaoEntity> _lista = List<OracaoEntity>.empty(growable: true);

    String _sql = "select ORA.id, ORA.texto from oracao ORA ";

    await _connection.queryFind(_sql).then((value) {
      for (final row in value) {
        OracaoEntity _oracao = OracaoEntity(
          row["oracao"]?["id"],
          row["oracao"]?["texto"],
        );

        _lista.add(_oracao);
      }
    });

    return _lista;
  }

  @override
  Future<OracaoEntity> findById(int id) async {
    ConnectionConfig _connection = ConnectionConfig();
    OracaoEntity _oracao = OracaoEntity(0, "");

    String _sql = "select ORA.id, " +
        "ORA.texto " +
        "from oracao ORA " +
        "where ORA.id = " +
        id.toString();

    await _connection.queryFind(_sql).then((value) {
      for (final row in value) {
        _oracao = OracaoEntity(
          row["oracao"]?["id"],
          row["oracao"]?["texto"],
        );
      }
    });

    return _oracao;
  }
}
