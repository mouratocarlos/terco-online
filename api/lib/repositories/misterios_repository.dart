import 'package:api/models/entity/misterios_entity.dart';
import 'package:api/repositories/base_repository.dart';

class MisteriosRepository extends BaseRepository {
  @override
  void instanceEntity() {
    entity = MisteriosEntity.b();
  }
}
