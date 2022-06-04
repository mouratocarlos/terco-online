class OracaoRezadaEntity {
  int idOracao;
  int quantidade;

  OracaoRezadaEntity(
    this.idOracao,
    this.quantidade,
  );

  Map toJson() => {
        'idOracao': idOracao,
        'quantidade': quantidade,
      };
}
