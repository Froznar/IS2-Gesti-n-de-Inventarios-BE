import 'dart:async';
import 'package:di/di.dart';

import 'package:postgresql/postgresql.dart' as pg;
import '../config/db_connection.dart';
import '../model/product_type.dart';

class ProducTypeRepository {
  DbConnection connection;
  ProducTypeRepository(this.connection);

  Future<ProductType> find(int id) async {
    ProductType productType = (await connection.query('SELECT * FROM "type_product" WHERE id_type_product = @id', {'id': id})).map(mapRowToProvider).first;
    return productType;
  }

  ProductType mapRowToProductType(pg.Row row) {
    return new ProductType()
      ..id_type_product = row.id_type_product
      ..type_name = row.type_name
      ..description = row.description
  }
}
