import 'dart:async';
import 'package:di/di.dart';

import 'package:postgresql/postgresql.dart' as pg;
import '../config/db_connection.dart';
import '../model/product_type.dart';

class ProductTypeRepository {
  DbConnection connection;
  ProductTypeRepository(this.connection);

  Future<ProductType> find(int id) async {
    ProductType productType = (await connection.query('SELECT * FROM "product_type" WHERE id_product_type = @id', {'id': id})).map(mapRowToProductType).first;
    return productType;
  }

    ProductType mapRowToProductType(pg.Row row) {
      return new ProductType()
	  ..id_product_type = row.id_product_type
	  ..name_product_type = row.name_product_type
	  ..description = row.description;
  }
}
