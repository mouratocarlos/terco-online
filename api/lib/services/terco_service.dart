import 'package:api/models/terco_entity.dart';
import 'package:api/repositories/terco_repository.dart';
import 'package:api/services/base_service.dart';

class TercoService extends BaseService {
  TercoRepository repository = TercoRepository();

  List<TercoEntity> findAll() {
    TercoEntity terco = TercoEntity(
      4,
      'Terço da Misericórdia',
      5,
      6,
    );

    TercoEntity terco2 = TercoEntity(
      4,
      'Terço Ave Maria',
      5,
      6,
    );

    List<TercoEntity> listaTercos = [terco, terco2];

    return listaTercos;
  }
}
