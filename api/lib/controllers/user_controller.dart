import 'dart:async';

import 'package:api/models/user.dart';
import 'package:api/services/user_service.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class UserController {
  UserService service = UserService();
  User entity = User();

  FutureOr<Response> getAll(Request request) {
    return Response.ok(service.retornaMensagem());
  }

  FutureOr<Response> getByUser(Request request, String id) {
    entity.id = id;
    return Response.ok('Retorna usuário do id: ${entity.id}');
  }

  Router get router => _$UserControllerRouter(this);
}

Router _$UserControllerRouter(UserController service) {
  final router = Router();
  router.get('/', service.getAll);
  router.get('/<id>', service.getByUser);
  return router;
}
