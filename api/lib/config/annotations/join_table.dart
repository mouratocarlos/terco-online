class JoinTable {
  final String? name;
  final dynamic joinColumns;
  final dynamic inverseJoinColumns;

  const JoinTable({
    this.name,
    this.joinColumns,
    this.inverseJoinColumns,
  });
}
