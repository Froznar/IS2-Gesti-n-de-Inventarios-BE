import 'dart:async';
import 'package:di/di.dart';

import 'package:postgresql/postgresql.dart' as pg;
import '../config/db_connection.dart';
import '../model/vendedor.dart';

class UserVentasRepository {
  DbConnection connection;

  UserVentasRepository(this.connection);

  Future<Vendedor> find(int id) async {
    Vendedor vendedor = (await connection.query('SELECT * FROM "vendedor" WHERE id_vendedor = @id ', {'id': id})).map(mapRowToVendedor).first;
    return vendedor;
  }

  Future<Vendedor> find_name(String name) async {
    Vendedor vendedor = (await connection.query('SELECT * FROM "vendedor" WHERE name_vendedor = @name ', {'name': name})).map(mapRowToVendedor).first;
    return vendedor;
  }

  Future<List<Vendedor>> findAll() async {
    return (await connection.query('SELECT * FROM "user" ')).map(mapRowToVendedor).toList();
  }

  Vendedor mapRowToVendedor(pg.Row row) {
    return new Vendedor()
      ..id_vendedor = row.id_vendedor
      ..name_vendedor = row.name_vendedor;
  }
}
