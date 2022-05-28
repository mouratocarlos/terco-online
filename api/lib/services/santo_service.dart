import 'dart:convert';
import 'dart:mirrors';

import 'package:api/config/connection_config.dart';
import 'package:api/models/entity/santo_entity.dart';
import 'package:api/services/base_service.dart';

class SantoService extends BaseService {
  void post(String obj) async {
    final _json = jsonDecode(obj);
    SantoEntity _santo = SantoEntity(
      0,
      _json['mencao'],
      _json['resposta'],
      _json['isFavorito'],
    );

    print(_santo.id);
    print(_santo.isFavorito);
    print(_santo.resposta);
    print(_santo.mencao);

    ConnectionConfig connection = ConnectionConfig();
    // connection.conectar();
    await connection.query(
        "INSERT INTO santo (mencao, resposta, is_favorito) VALUES (@mencao, @reposta, @isFavorito)",
        substitutionValues: {
          "mencao": _santo.mencao,
          "reposta": _santo.resposta,
          "isFavorito": _santo.isFavorito,
        });
  }
}
