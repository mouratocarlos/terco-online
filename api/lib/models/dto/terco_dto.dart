import 'package:api/models/dto/base_dto.dart';

class TercoDto extends BaseDto {
  String? descricaoTerco;
  String? oracaoBolinhaAveMaria;
  String? oracaoBolinhaPaiNosso;

  TercoDto(
    int id,
    this.descricaoTerco,
    this.oracaoBolinhaAveMaria,
    this.oracaoBolinhaPaiNosso,
  ) : super(id);

  Map toJson() => {
        'id': id,
        'descricaoTerco': descricaoTerco,
        'oracaoBolinhaAveMaria': oracaoBolinhaAveMaria,
        'oracaoBolinhaPaiNosso': oracaoBolinhaPaiNosso,
      };
}
