import 'dart:async';
import 'package:di/di.dart';

import 'package:postgresql/postgresql.dart' as pg;
import '../config/db_connection.dart';
import '../model/almacen.dart';

class AlmacenRepository {
  DbConnection connection;

  AlmacenRepository(this.connection);

  Future<Almacen> find(int id) async {
    Almacen almacen = (await connection.query('SELECT * FROM "almacen" WHERE id_almacen = @id', {'id': id})).map(mapRowToProveedor).first;
    return almacen;
  }

  Future<List<Almacen>> findAll() async {
    return (await connection.query('SELECT * FROM "almacen" ')).map(mapRowToProveedor).toList();
  }

  Almacen mapRowToProveedor(pg.Row row) {
    return new Almacen()
      ..id_almacen = row.id_almacen
      ..name_almacen = row.name_almacen
      ..map = row.almacen;
  }
}