import 'dart:convert';

import 'package:api/models/entity/santo_entity.dart';
import 'package:api/repositories/santo_repository.dart';
import 'package:api/services/base_service.dart';

class SantoService extends BaseService {
  @override
  void instanceRepository() {
    repository = SantoRepository();
  }

  @override
  void post(String obj) async {
    final json = jsonDecode(obj);

    SantoEntity santo = SantoEntity(
      0,
      json['mencao'],
      json['resposta'],
      json['isFavorito'],
    );

    repository.post(santo);
  }
}
