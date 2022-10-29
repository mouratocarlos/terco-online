import 'dart:convert';
import 'dart:io';
import 'package:api/services/base_service.dart';
import 'package:api/utils/messages.dart';
import 'package:api/utils/utils.dart';
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

  Future<Response> findById(Request request, String id) async {
    try {
      return Response.ok(
        jsonEncode(
          Utils.returnObjectResponse(
            HttpStatus.ok,
            Messages.MESSAGE_SUCESS,
            data: await _service.findById(int.parse(id)),
          ),
        ),
      );
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
  }

  Future<Response> findAll(Request request) async {
    try {
      return Response.ok(
        jsonEncode(
          Utils.returnObjectResponse(
            HttpStatus.ok,
            Messages.MESSAGE_SUCESS,
            data: await _service.findAll(),
          ),
        ),
      );
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
  }

  Future<Response> post(Request request) async {
    try {
      await _service.post(await request.readAsString());

      return Response.ok(
        jsonEncode(
          Utils.returnObjectResponse(
            HttpStatus.ok,
            Messages.MESSAGE_SUCESS,
          ),
        ),
      );
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
  }

  Future<Response> put(Request request) async {
    try {
      await _service.put(await request.readAsString());
      return Response.ok(
        jsonEncode(
          Utils.returnObjectResponse(
            HttpStatus.ok,
            Messages.MESSAGE_SUCESS,
          ),
        ),
      );
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
  }

  Future<Response> deleteById(Request request, String id) async {
    try {
      await _service.deleteById(int.parse(id));
      return Response.ok(
        jsonEncode(
          Utils.returnObjectResponse(
            HttpStatus.ok,
            Messages.MESSAGE_SUCESS,
          ),
        ),
      );
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
  }
}
