import 'dart:convert';

import 'package:api/controllers/base_controller.dart';
import 'package:api/services/santo_service.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class SantoController extends BaseController {
  SantoService service = SantoService();

  Future<Response> post(Request request) async {
    String body = await request.readAsString();
    service.post(body);
    return Response.ok("Ok");
  }

  Router get router => _$SantoControllerRouter(this);
}

Router _$SantoControllerRouter(SantoController controller) {
  final router = Router();
  router.post('/', controller.post);
  return router;
}
