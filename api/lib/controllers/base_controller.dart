import 'dart:convert';

import 'package:api/services/base_service.dart';
import 'package:shelf/shelf.dart';

abstract class BaseController {
  late BaseService _service;

  void instanceService();

  BaseController() {
    instanceService();
  }

  set service(BaseService service) {
    _service = service;
  }

  // ignore: unnecessary_getters_setters
  BaseService get service {
    return _service;
  }

  Future<Response> post(Request request) async {
    _service.post(await request.readAsString());
    return Response.ok("Ok");
  }

  Future<Response> findAll(Request request) async {
    return Response.ok(jsonEncode(await _service.findAll()));
  }

  Future<Response> findById(Request request, String id) async {
    return Response.ok(jsonEncode(await _service.findById(int.parse(id))));
  }
}
