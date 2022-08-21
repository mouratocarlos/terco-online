class Column {
  final String name;
  final bool nullable;
  final int? length;

  const Column({
    required this.name,
    required this.nullable,
    this.length,
  });
}
