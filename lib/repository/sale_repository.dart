import 'dart:async';
import 'package:di/di.dart';

import 'package:postgresql/postgresql.dart' as pg;
import '../config/db_connection.dart';
import '../model/sale.dart';

class SaleRepository {
  DbConnection connection;

  SaleRepository(this.connection);

  Future<Sale> find(int id) async {
    Sale sale = (await connection.query('SELECT * FROM "sale" WHERE id_sale = @id', {'id': id})).map(mapRowToSale).first;
    return sale;
  }

//General Find Product
  Future<List<Sale>> findAll() async {
    return (await connection.query('SELECT * FROM "sale" ')).map(mapRowToSale).toList();
  }

//Insertar Venta

  Future<Sale> insert(int id) async {
    Sale sale = (await connection.query('SELECT * FROM "sale" WHERE id_sale = @id', {'id': id})).map(mapRowToSale).first;
    return sale;
  }


  Sale mapRowToSale(pg.Row row) {
    return new Sale()
      ..id = row.id_sale
      ..nameBuyer = row.name_buyer
      ..DNI = row.dni
      ..RUC = row.ruc
      ..address = row.address
      ..voucher = row.voucher
      ..priceTotal = row.price_total
      ..dateSale=row.date_sale;

  }
}