import 'dart:async';
import 'package:di/di.dart';

import 'package:postgresql/postgresql.dart' as pg;
import '../config/db_connection.dart';
import '../model/sale.dart';
import '../model/product.dart';
import '../repository/product_repository.dart';

class SaleRepository {
  DbConnection connection;

  ProductRepository productRepository;
  SaleRepository(this.connection);

  Future<Sale> find(int id) async {
    Sale sale = (await connection.query('SELECT * FROM "sale" WHERE id = @id', {'id': id})).map(mapRowToSale).first;
    List<int> ids = (await connection.query('select id_product * from "sale_product" where id_sale = @id_sale;', {'id_sale': id})).map(mapRowToInt).toList();
    for(int i = 0; i < ids.length; i++){
      //Product p;
      productRepository.find(ids[i]).then((Product p) {sale.listProduct.add(p);});
      //sale.listProduct.add(p);
    }
    return sale;
  }
//General Find Product
  Future<List<Sale>> findAll() async {
    return (await connection.query('SELECT * FROM "sale" ')).map(mapRowToSale).toList();
  }


  Sale mapRowToSale(pg.Row row) {
    return new Sale()
      ..id = row.id
      ..nameBuyer = row.nameBuyer
      ..DNI = row.DNI
      ..RUC = row.RUC
      ..address = row.address
      ..voucher = row.voucher
      ..priceTotal = row.priceTotal
      ..dateSale =row.dateSale;

  }
  int mapRowToInt(pg.Row row){
    return row.id_product;
  }
}

