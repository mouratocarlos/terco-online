import 'package:api/models/base_entity.dart';

class SantoTercoEntity extends BaseEntity {
  int idTerco;
  int idSanto;
  int ordem;

  SantoTercoEntity(
    int id,
    this.idTerco,
    this.idSanto,
    this.ordem,
  ) : super(id);
}
