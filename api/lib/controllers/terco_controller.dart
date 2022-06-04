import 'package:api/controllers/base_controller.dart';
import 'package:api/services/terco_service.dart';
import 'package:shelf_router/shelf_router.dart';

class TercoController extends BaseController {
  @override
  void instanceService() {
    service = TercoService();
  }

  Router get router => _$TercoControllerRouter(this);
}

Router _$TercoControllerRouter(TercoController controller) {
  final _router = Router();
  _router.post('/', controller.post);
  _router.get('/', controller.findAll);
  _router.get('/<id>', controller.findById);
  return _router;
}
