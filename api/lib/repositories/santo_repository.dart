import 'package:api/models/entity/santo_entity.dart';
import 'package:api/repositories/base_repository.dart';

class SantoRepository extends BaseRepository {
  @override
  void instanceEntity() {
    entity = SantoEntity.b();
  }

  @override
  void instanceDto() {
    // entity = TercoEntity.b();
  }

  @override
  String sqlFindAll() {
    return "select * from santo ORDER BY id";
  }
}
