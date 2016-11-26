import 'dart:async';
import 'package:di/di.dart';

import 'package:postgresql/postgresql.dart' as pg;
import '../config/db_connection.dart';
import '../model/client.dart';

class ClientRepository {
  DbConnection connection;

  ClientRepository(this.connection);

  Future<Client> find(int id) async {
    Client client = (await connection.query('SELECT * FROM "client" WHERE id = @id', {'id': id})).map(mapRowToClient).first;
    return client;
  }



  Future<List<Client>> findAll() async {
    return (await connection.query('SELECT * FROM "client"')).map(mapRowToClient).toList();
  }

  Client mapRowToClient(pg.Row row) {
    return new Client()
      ..id = row.id
      ..first_name = row.first_name
      ..last_name = row.last_name
      ..dni=row.dni
      ..ruc=row.ruc
      ..client_type = row.client_type;
  }
}
