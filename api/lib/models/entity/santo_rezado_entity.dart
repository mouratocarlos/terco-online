class SantoRezadoEntity {
  int idSanto;
  int quantidade;

  SantoRezadoEntity(
    this.idSanto,
    this.quantidade,
  );

  Map toJson() => {
        'idSanto': idSanto,
        'quantidade': quantidade,
      };
}
