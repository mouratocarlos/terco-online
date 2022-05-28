import 'dart:convert';

import 'package:api/config/connection_config.dart';
import 'package:api/models/dto/terco_dto.dart';
import 'package:api/models/entity/terco_entity.dart';
import 'package:api/repositories/terco_repository.dart';
import 'package:api/services/base_service.dart';

class TercoService extends BaseService {
  final TercoRepository _repository = TercoRepository();

  Future<List<TercoDto>> findAll() async {
    return await _repository.findAll();
  }

  void post(String obj) async {
    final _json = jsonDecode(obj);
    TercoEntity _terco = TercoEntity(
      0,
      _json['descricao'],
      _json['id_oracao_ave_maria'],
      _json['id_oracao_bolinha_pai_nosso'],
    );

    _repository.post(_terco);
  }
}
