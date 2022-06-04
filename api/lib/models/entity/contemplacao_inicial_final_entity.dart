import 'package:api/models/entity/base_entity.dart';

class ContemplacaoInicialFinalEntity extends BaseEntity {
  int idTerco;
  int idOracao;
  int ordem;
  String tipo;

  ContemplacaoInicialFinalEntity(
    int id,
    this.idTerco,
    this.idOracao,
    this.ordem,
    this.tipo,
  ) : super(id);

  Map toJson() => {
        'id': id,
        'idTerco': idTerco,
        'idOracao': idOracao,
        'ordem': ordem,
        'tipo': tipo,
      };
}
