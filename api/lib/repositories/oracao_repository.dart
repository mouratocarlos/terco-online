import 'package:api/models/entity/oracao_entity.dart';
import 'package:api/repositories/base_repository.dart';

class OracaoRepository extends BaseRepository {
  @override
  void instanceEntity() {
    entity = OracaoEntity.b();
  }
}
