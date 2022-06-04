import 'package:api/models/entity/base_entity.dart';

class TercoEntity extends BaseEntity {
  String descricao;
  int idOracaoBolinhaPaiNosso;
  int idOracaoBolinhaAveMaria;

  TercoEntity(
    int id,
    this.descricao,
    this.idOracaoBolinhaAveMaria,
    this.idOracaoBolinhaPaiNosso,
  ) : super(id);

  Map toJson() => {
        'id': id,
        'descricao': descricao,
        'idOracaoBolinhaAveMaria': idOracaoBolinhaAveMaria,
        'idOracaoBolinhaPaiNosso': idOracaoBolinhaPaiNosso,
      };
}
