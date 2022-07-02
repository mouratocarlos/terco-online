import 'dart:convert';
import 'package:api/models/entity/oracao_entity.dart';
import 'package:api/repositories/oracao_repository.dart';
import 'package:api/services/base_service.dart';

class OracaoService extends BaseService {
  @override
  void instanceRepository() {
    repository = OracaoRepository();
  }

  @override
  void post(String obj) async {
    final json = jsonDecode(obj);

    OracaoEntity oracao = OracaoEntity(
      0,
      json['texto'],
    );

    repository.post(oracao);
  }
}
