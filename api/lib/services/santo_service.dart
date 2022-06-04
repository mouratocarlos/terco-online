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
  void post(String _obj) async {
    final _json = jsonDecode(_obj);

    SantoEntity _santo = SantoEntity(
      0,
      _json['mencao'],
      _json['resposta'],
      _json['isFavorito'],
    );

    repository.post(_santo);
  }
}
