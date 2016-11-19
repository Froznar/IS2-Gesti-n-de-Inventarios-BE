import 'dart:async';
import 'package:di/di.dart';

import 'package:postgresql/postgresql.dart' as pg;
import '../config/db_connection.dart';
import '../model/product.dart';

class ProductRepository {
  DbConnection connection;

  ProductRepository(this.connection);

//  Seleccion por Id de Product
  Future<Product> find(int id) async {
    Product product = (await connection.query('SELECT * FROM "product" WHERE idProduct = @id', {'id': id})).map(mapRowToProduct).first;
    return product;
  }

//General Find Product
  Future<List<Product>> findAll() async {
    return (await connection.query('SELECT * FROM "product" ')).map(mapRowToProduct).toList();
  }


  Product mapRowToProduct(pg.Row row) {
    return new Product()
      ..id = row.id
      ..nameProduct = row.nameProduct
      ..price = row.price
      ..stack = row.stack
      ..productType = row.productTypee;

  }
}


