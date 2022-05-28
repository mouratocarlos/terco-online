import 'package:api/config/connection_config.dart';
import 'package:api/utils/routes.dart' as function_library;
import 'package:functions_framework/serve.dart';

Future<void> main(List<String> args) async {
  await serve(args, _nameFunctionTarget);
}

FunctionTarget? _nameFunctionTarget(String name) {
  switch (name) {
    case 'function':
      return FunctionTarget.http(
        function_library.routes,
      );
    default:
      return null;
  }
}
