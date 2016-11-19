import 'dart:async';
import 'package:di/di.dart';

import 'package:postgresql/postgresql.dart' as pg;
import '../config/db_connection.dart';
import '../model/sale.dart';

class SaleRepository {
  DbConnection connection;

  SaleRepository(this.connection);

  Future<Sale> find(int id) async {
    Sale product = (await connection.query('SELECT * FROM "sale" WHERE id = @id', {'id': id})).map(mapRowToSale).first;
    return product;
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
}

