import 'package:api/controllers/base_controller.dart';
import 'package:api/services/santo_service.dart';
import 'package:shelf_router/shelf_router.dart';

class SantoController extends BaseController {
  @override
  void instanceService() {
    service = SantoService();
  }

  Router get router => _santoControllerRouter(this);
}

Router _santoControllerRouter(SantoController controller) {
  final router = Router();
  router.post('/', controller.post);
  router.get('/', controller.findAll);
  router.get('/<id>', controller.findById);
  return router;
}
