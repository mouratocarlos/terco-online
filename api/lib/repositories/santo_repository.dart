import 'package:api/models/entity/santo_entity.dart';
import 'package:api/repositories/base_repository.dart';

class SantoRepository extends BaseRepository {
  @override
  void instanceEntity() {
    entity = SantoEntity.b();
  }
}
