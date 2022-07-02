import 'package:api/controllers/base_controller.dart';
import 'package:api/services/oracao_service.dart';
import 'package:shelf_router/shelf_router.dart';

class OracaoController extends BaseController {
  @override
  void instanceService() {
    service = OracaoService();
  }

  Router get router => _oracaoControllerRouter(this);
}

Router _oracaoControllerRouter(OracaoController controller) {
  final router = Router();
  router.post('/', controller.post);
  router.get('/', controller.findAll);
  router.get('/<id>', controller.findById);
  return router;
}
