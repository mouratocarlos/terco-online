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
  void post(String _obj) async {
    final _json = jsonDecode(_obj);

    OracaoEntity _oracao = OracaoEntity(
      0,
      _json['texto'],
    );

    repository.post(_oracao);
  }
}
