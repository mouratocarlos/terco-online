import 'dart:async';

import 'package:api/services/terco_service.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class TercoController {
  TercoService service = TercoService();

  FutureOr<Response> getAll(Request request) {
    return Response.ok(service.retornaMensagem());
  }

  FutureOr<Response> getByUser(Request request, String id) {
    return Response.ok('Id do Terço: $id');
  }

  Router get router => _$TercoControllerRouter(this);
}

Router _$TercoControllerRouter(TercoController service) {
  final router = Router();
  router.get('/', service.getAll);
  router.get('/<id>', service.getByUser);
  return router;
}
