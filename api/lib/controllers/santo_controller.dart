import 'package:api/controllers/base_controller.dart';
import 'package:api/services/santo_service.dart';
import 'package:shelf_router/shelf_router.dart';

class SantoController extends BaseController {
  @override
  void instanceService() {
    service = SantoService();
  }

  Router get router => _$SantoControllerRouter(this);
}

Router _$SantoControllerRouter(SantoController controller) {
  final _router = Router();
  _router.post('/', controller.post);
  _router.get('/', controller.findAll);
  _router.get('/<id>', controller.findById);
  return _router;
}
