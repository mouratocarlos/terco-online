import 'package:api/repositories/terco_repository.dart';

class TercoService {
  TercoRepository repository = TercoRepository();

  String retornaMensagem() {
    return 'Amém!';
  }
}
