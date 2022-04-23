import 'dart:async';

import 'package:api/controllers/terco_controller.dart';
import 'package:functions_framework/functions_framework.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

@CloudFunction()
FutureOr<Response> routes(Request request) async {
  final router = Router();

  router.mount('/terco', TercoController().router);

  return router(request);
}
