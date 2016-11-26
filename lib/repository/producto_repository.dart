import 'dart:async';
import 'package:di/di.dart';

import 'package:postgresql/postgresql.dart' as pg;
import '../config/db_connection.dart';
import '../model/producto.dart';

class ProductoRepository {
  DbConnection connection;

  PoductoRepository(this.connection);

  Future<Producto> find(int id) async {
    Producto producto = (await connection.query('SELECT * FROM "producto" WHERE id_producto = @id', {'id': id})).map(mapRowToProveedor).first;
    return producto;
  }

  Future<Producto> find_id_almacen(int id_almacen) async {
    Producto producto = (await connection.query('SELECT * FROM "producto" WHERE id_almacen = @id', {'id': id})).map(mapRowToProveedor).first;
    return producto;
  }


  Future<List<Producto>> findAll() async {
    return (await connection.query('SELECT * FROM "producto" ')).map(mapRowToProveedor).toList();
  }

  Producto mapRowToProveedor(pg.Row row) {
    return new Almacen()
    ..id_producto = row.id_producto
    ..name_producto = row.name_producto
    ..codigo = row.codigo
    ..costo_unitario = row.costo_unitario
    ..grupo = row.grupo
    ..subgrupo = row.subgrupo
    ..tiempo_demora_entrega = row.tiempo_demora_entrega
    ..ubicacion_en_almacen = row.ubicacion_en_almacen
    ..id_almacen=row.id_almacen;
  }
}