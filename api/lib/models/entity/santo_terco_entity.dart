import 'package:api/models/entity/base_entity.dart';

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

  Map toJson() => {
        'id': id,
        'idTerco': idTerco,
        'idSanto': idSanto,
        'ordem': ordem,
      };
}
