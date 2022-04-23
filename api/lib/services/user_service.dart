import 'package:api/repositories/user_repository.dart';

class UserService {
  UserRepository repository = UserRepository();

  String retornaMensagem() {
    return 'Hello World!';
  }
}
