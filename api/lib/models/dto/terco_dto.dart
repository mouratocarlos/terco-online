class TercoDto {
  String descricaoTerco;
  String oracaoBolinhaAveMaria;
  String oracaoBolinhaPaiNosso;

  TercoDto(
    this.descricaoTerco,
    this.oracaoBolinhaAveMaria,
    this.oracaoBolinhaPaiNosso,
  );

  Map toJson() => {
        'descricaoTerco': descricaoTerco,
        'oracaoBolinhaAveMaria': oracaoBolinhaAveMaria,
        'oracaoBolinhaPaiNosso': oracaoBolinhaPaiNosso
      };
}
