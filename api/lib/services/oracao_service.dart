import 'dart:convert';

import 'package:api/config/connection_config.dart';
import 'package:api/models/entity/oracao_entity.dart';
import 'package:api/services/base_service.dart';

class OracaoService extends BaseService {
  String findById(int id) {
    return 'oração $id';
  }

  void post(String obj) async {
    final _json = jsonDecode(obj);
    OracaoEntity _oracao = OracaoEntity(
      0,
      _json['texto'],
    );

    ConnectionConfig connection = ConnectionConfig();
    await connection.query("INSERT INTO oracao (texto) VALUES (@texto)",
        substitutionValues: {
          "texto": _oracao.texto,
        });
  }
}
