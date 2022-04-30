import 'package:api/models/base_entity.dart';

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
}
