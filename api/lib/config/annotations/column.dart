class Column {
  final String name;
  final bool nullable;
  final int? lenght;

  const Column(
    this.name,
    this.nullable, [
    this.lenght,
  ]);
}
