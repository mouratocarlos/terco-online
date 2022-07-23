import 'package:api/models/entity/terco_entity.dart';
import 'package:api/repositories/base_repository.dart';

class TercoRepository extends BaseRepository {
  @override
  void instanceEntity() {
    entity = TercoEntity.b();
  }
}
