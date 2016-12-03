import 'dart:async';

import 'package:postgresql/postgresql.dart' as pg;
import '../config/db_connection.dart';
import '../model/warehouse.dart';

class WarehouseRepository {
  DbConnection connection;

  WarehouseRepository(this.connection);

  Future<Warehouse> find(int id) async {
    Warehouse warehouse = (await connection.query('SELECT * FROM "warehouse" WHERE id_warehouse = @id', {'id': id})).map(mapRowToWarehouse).first;
    return warehouse;
  }

  Future<List<Warehouse>> findAll() async {
    return (await connection.query('SELECT * FROM "warehouse" ')).map(mapRowToWarehouse).toList();
  }

  Warehouse mapRowToWarehouse(pg.Row row) {
    return new Warehouse()
      ..id_warehouse = row.id_warehouse
      ..name_warehouse = row.name_warehouse
      ..map = row.map;
  }
}