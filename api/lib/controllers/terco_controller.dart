import 'dart:async';
import 'dart:convert';
import 'package:api/controllers/base_controller.dart';
import 'package:api/services/terco_service.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class TercoController extends BaseController {
  TercoService service = TercoService();

  Future<Response> findAll(Request request) async {
    var obj = await service.findAll();
    return Response.ok(jsonEncode(obj));
  }

  Future<Response> post(Request request) async {
    String body = await request.readAsString();
    service.post(body);
    return Response.ok("Ok");
  }

  Router get router => _$TercoControllerRouter(this);
}

Router _$TercoControllerRouter(TercoController controller) {
  final router = Router();
  router.get('/', controller.findAll);
  router.post('/', controller.post);
  return router;
}
