class TercoRezadoEntity {
  int idTerco;
  int quantidadeCompleto;
  int quantidadeIncompleto;

  TercoRezadoEntity(
    this.idTerco,
    this.quantidadeCompleto,
    this.quantidadeIncompleto,
  );

  Map toJson() => {
        'idTerco': idTerco,
        'quantidadeCompleto': quantidadeCompleto,
        'quantidadeIncompleto': quantidadeIncompleto,
      };
}
