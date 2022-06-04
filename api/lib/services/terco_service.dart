import 'dart:convert';
import 'package:api/models/entity/terco_entity.dart';
import 'package:api/repositories/terco_repository.dart';
import 'package:api/services/base_service.dart';

class TercoService extends BaseService {
  @override
  void instanceRepository() {
    repository = TercoRepository();
  }

  @override
  void post(String _obj) async {
    final _json = jsonDecode(_obj);

    TercoEntity _terco = TercoEntity(
      0,
      _json['descricao'],
      _json['id_oracao_ave_maria'],
      _json['id_oracao_bolinha_pai_nosso'],
    );

    repository.post(_terco);
  }
}
