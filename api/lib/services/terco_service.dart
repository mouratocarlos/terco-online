import 'package:api/repositories/terco_repository.dart';
import 'package:api/services/base_service.dart';

class TercoService extends BaseService {
  @override
  void instanceRepository() {
    repository = TercoRepository();
  }
}
