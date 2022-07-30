class ResponseData {
  int status;
  Object? data;
  String? message;
  String tipo;

  ResponseData({
    required this.status,
    this.data,
    this.message,
    required this.tipo,
  });

  Map toJson() {
    return {
      "status": status,
      "data": data,
      "message": message,
      "tipo": tipo,
    };
  }
}
