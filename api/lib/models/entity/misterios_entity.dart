import 'package:api/models/entity/base_entity.dart';

class MisteriosEntity extends BaseEntity {
  int idTerco;
  int idOracao;
  int ordem;
  String misterio;

  MisteriosEntity(
    int id,
    this.idTerco,
    this.idOracao,
    this.ordem,
    this.misterio,
  ) : super(id);
}
