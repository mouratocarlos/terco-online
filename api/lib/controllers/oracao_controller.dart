import 'package:api/controllers/base_controller.dart';
import 'package:api/services/oracao_service.dart';
import 'package:shelf_router/shelf_router.dart';

class OracaoController extends BaseController {
  @override
  void instanceService() {
    service = OracaoService();
  }

  Router get router => _$OracaoControllerRouter(this);
}

Router _$OracaoControllerRouter(OracaoController controller) {
  final _router = Router();
  _router.post('/', controller.post);
  _router.get('/', controller.findAll);
  _router.get('/<id>', controller.findById);
  return _router;
}
