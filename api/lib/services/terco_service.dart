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
  void post(String obj) async {
    final json = jsonDecode(obj);

    TercoEntity terco = TercoEntity(
      0,
      json['descricao'],
      json['id_oracao_ave_maria'],
      json['id_oracao_bolinha_pai_nosso'],
    );

    repository.post(terco);
  }
}
