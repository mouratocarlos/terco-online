import 'package:api/repositories/santo_repository.dart';
import 'package:api/services/base_service.dart';

class SantoService extends BaseService {
  @override
  void instanceRepository() {
    repository = SantoRepository();
  }
}
