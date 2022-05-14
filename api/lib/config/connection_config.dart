import 'package:postgres/postgres.dart';

class ConnectionConfig {
  void conectar() async {
    final conn = PostgreSQLConnection(
      'localhost',
      5498,
      'tercodb',
      username: 'tercoadmin',
      password: 'tercoonline2022',
    );

    await conn.open();
    await conn.close();
    await conn.query('');
  }
}
