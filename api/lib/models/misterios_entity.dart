import 'package:api/models/base_entity.dart';

class Misterios extends BaseEntity {
  int idTerco;
  int idOracao;
  int ordem;
  String misterio;

  Misterios(
    int id,
    this.idTerco,
    this.idOracao,
    this.ordem,
    this.misterio,
  ) : super(id);
}
