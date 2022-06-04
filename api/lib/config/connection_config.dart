import 'package:postgres/postgres.dart';

class ConnectionConfig {
  final _conn = PostgreSQLConnection(
    "localhost",
    5498,
    "tercodb",
    username: "tercoadmin",
    password: "tercoonline2022",
  );

  Future<PostgreSQLResult> query(String query,
      {Map<String, dynamic>? substitutionValues}) async {
    await _conn.open();
    return await _conn.query(
      query,
      substitutionValues: substitutionValues,
    );
  }

  Future<List<Map<String, Map<String, dynamic>>>> queryFind(String query,
      {Map<String, dynamic>? substitutionValues}) async {
    await _conn.open();
    return await _conn.mappedResultsQuery(
      query,
      substitutionValues: substitutionValues,
    );
  }
}
