import 'package:postgres/postgres.dart';

class ConnectionConfig {
  final conn = PostgreSQLConnection(
    "localhost",
    5498,
    "tercodb",
    username: "tercoadmin",
    password: "tercoonline2022",
  );

  Future<PostgreSQLResult> query(String query,
      {Map<String, dynamic>? substitutionValues}) async {
    await conn.open();
    return await conn.query(
      query,
      substitutionValues: substitutionValues,
    );
  }

  Future<List<Map<String, Map<String, dynamic>>>> queryFind(String query,
      {Map<String, dynamic>? substitutionValues}) async {
    await conn.open();
    return await conn.mappedResultsQuery(
      query,
      substitutionValues: substitutionValues,
    );
  }
}
