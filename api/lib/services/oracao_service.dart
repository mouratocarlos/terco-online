import 'package:api/repositories/oracao_repository.dart';
import 'package:api/services/base_service.dart';

class OracaoService extends BaseService {
  @override
  void instanceRepository() {
    repository = OracaoRepository();
  }
}
