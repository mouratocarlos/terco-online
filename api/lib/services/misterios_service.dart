import 'package:api/repositories/misterios_repository.dart';
import 'package:api/services/base_service.dart';

class MisteriosService extends BaseService {
  @override
  void instanceRepository() {
    repository = MisteriosRepository();
  }
}
