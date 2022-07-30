import 'dart:convert';

import 'package:api/services/base_service.dart';
import 'package:api/utils/messages.dart';
import 'package:api/utils/response_data.dart';
import 'package:shelf/shelf.dart';

abstract class BaseController {
  late BaseService _service;
  late ResponseData _responseData;

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
      _responseData = ResponseData(
        status: 200,
        tipo: 'OBJETO',
        message: Messages.MESSAGE_SUCESS,
        data: await _service.findById(int.parse(id)),
      );

      return Response.ok(jsonEncode(_responseData));
    } catch (error) {
      String errorMessage = error.toString();

      if (errorMessage.contains("Exception: [")) {
        errorMessage = errorMessage.substring(12, errorMessage.length - 1);
      }

      _responseData = ResponseData(
        status: 400,
        tipo: 'ERRO',
        message: errorMessage,
      );

      return Response.badRequest(body: jsonEncode(_responseData));
    }
  }

  Future<Response> findAll(Request request) async {
    try {
      _responseData = ResponseData(
        status: 200,
        tipo: 'OBJETO',
        message: Messages.MESSAGE_SUCESS,
        data: await _service.findAll(),
      );

      return Response.ok(jsonEncode(_responseData));
    } catch (error) {
      _responseData = ResponseData(
        status: 400,
        tipo: 'ERRO',
        message: error.toString(),
      );

      return Response.badRequest(body: jsonEncode(_responseData));
    }
  }

  Future<Response> post(Request request) async {
    try {
      await _service.post(await request.readAsString());

      _responseData = ResponseData(
        status: 200,
        tipo: 'OBJETO',
        message: Messages.MESSAGE_SUCESS,
      );

      return Response.ok(jsonEncode(_responseData));
    } catch (error) {
      _responseData = ResponseData(
        status: 400,
        tipo: 'ERRO',
        message: error.toString(),
      );

      return Response.badRequest(body: jsonEncode(_responseData));
    }
  }

  Future<Response> put(Request request) async {
    try {
      await _service.put(await request.readAsString());

      _responseData = ResponseData(
        status: 200,
        tipo: 'OBJETO',
        message: Messages.MESSAGE_SUCESS,
      );

      return Response.ok(jsonEncode(_responseData));
    } catch (error) {
      _responseData = ResponseData(
        status: 400,
        tipo: 'ERRO',
        message: error.toString(),
      );

      return Response.badRequest(body: jsonEncode(_responseData));
    }
  }

  Future<Response> deleteById(Request request, String id) async {
    try {
      await _service.deleteById(int.parse(id));

      _responseData = ResponseData(
        status: 200,
        tipo: 'OBJETO',
        message: Messages.MESSAGE_SUCESS,
      );

      return Response.ok(jsonEncode(_responseData));
    } catch (error) {
      _responseData = ResponseData(
        status: 400,
        tipo: 'ERRO',
        message: error.toString(),
      );

      return Response.badRequest(body: jsonEncode(_responseData));
    }
  }
}
