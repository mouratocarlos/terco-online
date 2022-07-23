import 'package:api/controllers/base_controller.dart';
import 'package:api/services/terco_service.dart';
import 'package:shelf_router/shelf_router.dart';

class TercoController extends BaseController {
  @override
  void instanceService() {
    service = TercoService();
  }

  Router get router => _tercoControllerRouter(this);
}

Router _tercoControllerRouter(TercoController controller) {
  final router = Router();
  router.get('/<id>', controller.findById);
  router.get('/', controller.findAll);
  router.post('/', controller.post);
  router.put('/', controller.put);
  router.delete('/<id>', controller.deleteById);
  return router;
}
