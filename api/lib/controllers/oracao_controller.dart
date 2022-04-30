import 'package:api/controllers/base_controller.dart';
import 'package:api/services/oracao_service.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class OracaoController extends BaseController {
  OracaoService oracaoService = OracaoService();

  Future<Response> findById(Request request, String id) async {
    return Response.ok(oracaoService.findById(int.parse(id)));
  }

  Router get router => _$OracaoControllerRouter(this);
}

Router _$OracaoControllerRouter(OracaoController controller) {
  final router = Router();
  router.get('/<id>', controller.findById);
  return router;
}
