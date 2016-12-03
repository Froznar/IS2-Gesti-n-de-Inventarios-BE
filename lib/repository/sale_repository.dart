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

  //Busqueda Venta por Comprador
  Future<Sale> findSaleBuyer(String name_buyer) async {
    Sale sale = (await connection.query('SELECT * FROM "sale" WHERE name_buyer = @name_buyer', {'name_buyer':name_buyer})).map(mapRowToSale).first;
    return sale;
  }

//Insertar Venta

  Future<Sale> registerSale(String name_buyer,String dni1, String ruc1,String address,String voucher, String price_total1,String date_sale) async{
    int dni=int.parse(dni1);
    int ruc=int.parse(ruc1);
    double price_total=double.parse(price_total1);
    await connection.query('INSERT INTO "sale" (name_buyer,dni,ruc,address,voucher,price_total,date_sale) values (@name_buyer,@dni,@ruc,@address,@voucher,@price_total,@date_sale)', {'name_buyer':name_buyer,'dni':dni ,'ruc':ruc, 'address':address, 'voucher':voucher, 'price_total':price_total,'date_sale':date_sale});
    return findSaleBuyer(name_buyer);
  }

  Future<Sale> findLastSale() async {
    Sale sale = (await connection.query('SELECT * FROM "sale" ')).map(mapRowToSale).last;
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
      ..priceTotal = double.parse(row.price_total)
      ..dateSale = row.date_sale;
  }
}
