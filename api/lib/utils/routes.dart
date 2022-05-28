import 'dart:async';

import 'package:api/controllers/oracao_controller.dart';
import 'package:api/controllers/santo_controller.dart';
import 'package:api/controllers/terco_controller.dart';
import 'package:functions_framework/functions_framework.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

@CloudFunction()
FutureOr<Response> routes(Request request) async {
  final router = Router();

  router.mount('/terco', TercoController().router);

  router.mount('/oracao', OracaoController().router);

  router.mount('/santo', SantoController().router);

  return router(request);
}
