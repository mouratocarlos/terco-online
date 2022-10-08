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
  router.get('/<id>', controller.findById);
  router.get('/', controller.findAll);
  router.post('/', controller.post);
  router.put('/', controller.put);
  router.delete('/<id>', controller.deleteById);
  return router;
}
