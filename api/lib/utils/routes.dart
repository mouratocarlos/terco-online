import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:api/controllers/misterios_controller.dart';
import 'package:api/controllers/oracao_controller.dart';
import 'package:api/controllers/santo_controller.dart';
import 'package:api/controllers/terco_controller.dart';
import 'package:api/utils/utils.dart';
import 'package:functions_framework/functions_framework.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

@CloudFunction()
FutureOr<Response> routes(Request request) async {
  final router = Router();
  final pathRoute = '/terco-online/v1';

  try {
    router.mount(pathRoute + '/terco', TercoController().router);

    router.mount(pathRoute + '/oracao', OracaoController().router);

    router.mount(pathRoute + '/santo', SantoController().router);

    router.mount(pathRoute + '/misterios', MisteriosController().router);
  } catch (error) {
    return Response.badRequest(
      body: jsonEncode(
        Utils.returnObjectResponse(
          HttpStatus.badRequest,
          error.toString(),
        ),
      ),
    );
  }

  return router(request);
}
