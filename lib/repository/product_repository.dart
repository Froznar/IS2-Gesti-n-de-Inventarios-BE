import 'dart:async';
import 'package:postgresql/postgresql.dart' as pg;
import '../config/db_connection.dart';
import '../model/product.dart';

class ProductRepository
{
  DbConnection connection;

  ProductRepository(this.connection);

//  Seleccion por Id de Product
  Future<Product> find(int id)
  async {
    Product product = (await connection.query(
        'SELECT * FROM "product" WHERE id_product = @id', {'id': id}))
        .map(mapRowToProduct)
        .first;
    return product;
  }

//General Find Product
  Future<List<Product>> findAll()
  async {
    return (await connection.query('SELECT * FROM "product" ')).map(
        mapRowToProduct).toList();
  }

  Future<List<Product>> find_id_warehouse(int id) async {
    List<Product> products = (await connection.query('SELECT * FROM "product" WHERE id_warehouse = @id and stock>0', {'id': id})).map(mapRowToProduct).toList();
    return products;
  }

  //Seleccionar Nombres de Productos
  Future<Product> findProductName(String name) async {
    Product product = (await connection.query('SELECT * FROM "product" WHERE name_product = @name', {'name':name})).map(mapRowToProduct).first;
    return product;
  }

  /*Agregando Producto Repositorio*/
  Product mapRowToProduct(pg.Row row) {
    return new Product()
      ..id_product = row.id_product
      ..name_product = row.name_product
      ..price = double.parse(row.price)
      ..stock = row.stock
      ..grupo = row.grupo
      ..subgrupo = row.subgrupo
      ..codItem = row.cod_item
      ..codigo = row.codigo
      ..delivery_time = row.delivery_time
      ..warehouse_location = row.warehouse_location
      ..id_warehouse = row.id_warehouse;
  }

  String mapRowToString(pg.Row row) {
    return  row.name_product;
  }
}