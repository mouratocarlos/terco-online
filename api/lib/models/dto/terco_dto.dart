import 'package:api/models/dto/base_dto.dart';

class TercoDto extends BaseDto {
  String? _descricaoTerco;
  String? _oracaoBolinhaAveMaria;
  String? _oracaoBolinhaPaiNosso;

  TercoDto(
    int id,
    this._descricaoTerco,
    this._oracaoBolinhaAveMaria,
    this._oracaoBolinhaPaiNosso,
  ) : super(id);

  TercoDto.b() : super.b();

  String get descricaoTerco {
    return _descricaoTerco!;
  }

  set descricaoTerco(String descricaoTerco) {
    _descricaoTerco = descricaoTerco;
  }

  String get oracaoBolinhaAveMaria {
    return _oracaoBolinhaAveMaria!;
  }

  set oracaoBolinhaAveMaria(String oracaoBolinhaAveMaria) {
    _oracaoBolinhaAveMaria = oracaoBolinhaAveMaria;
  }

  String get oracaoBolinhaPaiNosso {
    return _oracaoBolinhaPaiNosso!;
  }

  set oracaoBolinhaPaiNosso(String oracaoBolinhaPaiNosso) {
    _oracaoBolinhaPaiNosso = oracaoBolinhaPaiNosso;
  }
}
