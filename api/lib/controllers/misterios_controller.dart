import 'package:api/controllers/base_controller.dart';
import 'package:api/services/misterios_service.dart';
import 'package:shelf_router/shelf_router.dart';

class MisteriosController extends BaseController {
  @override
  void instanceService() {
    service = MisteriosService();
  }

  Router get router => _misteriosControllerRouter(this);
}

Router _misteriosControllerRouter(MisteriosController controller) {
  final router = Router();
  router.get('/<id>', controller.findById);
  router.get('/', controller.findAll);
  router.post('/', controller.post);
  router.put('/', controller.put);
  router.delete('/<id>', controller.deleteById);
  return router;
}
