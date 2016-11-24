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
  SaleRepository(this.connection, this.productRepository);

  Future<Sale> find(int id) async {
    Sale sale = (await connection.query('SELECT * FROM "sale" WHERE id_sale = @id;', {'id': id})).map(mapRowToSale).first;
    /*List<int> ids = (await connection.query('select id_product from sale_product where id_sale = @id_sale;', {'id_sale': id})).map(mapRowToInt).toList();
    for(int i = 0; i < ids.length; i++){
      //Product p;
      productRepository.find(ids[i]).then((Product p) {sale.listProduct.add(p);});
      //sale.listProduct.add(p);
    }*/
    return sale;
  }
  Future<Sale2> find2(int id) async {
    Sale2 sale = (await connection.query('SELECT * FROM "sale" WHERE id_sale = @id;', {'id': id})).map(mapRowToSale2).first;
    return sale;
  }
//General Find Product
  Future<List<Sale>> findAll() async {
    //return (await connection.query('SELECT * FROM "sale" ')).map(mapRowToSale).toList();
    return (await connection.query('SELECT * FROM "sale";')).map(mapRowToSale).toList();
  }
  /*Future<List<Sale>> findByRangeDate(DateTime initialDate, DateTime finalDate) async {
  }*/
  Future<List<Product>> findProductsByIdSale(int id) async {//funcion para encontrar lps productos en una determinada venta, no sera necesaria
    List<Product> list = new List<Product> ();
    List<int> ids = (await connection.query('select id_product from "sale_product" where id_sale = @id_sale;', {'id_sale': id})).map(mapRowToInt).toList();
      for(int i = 0; i < ids.length; i++){
      //Product p;
      productRepository.find(ids[i]).then((Product p) {list.add(p);});
      //sale.listProduct.add(p);
    }
    return list;//despues debo convertir este future en uno normal
  }

  Sale mapRowToSale(pg.Row row) {
    return new Sale()
      ..id = row.id_sale
      ..nameBuyer = row.namebuyer
      ..DNI = row.dni
      ..RUC = row.ruc
      ..address = row.address
      ..voucher = row.voucher
      ..priceTotal = row.pricetotal
      ..dateSale =row.datesale;

  }

  Sale mapRowToSale2(pg.Row row) {
    Sale s = new Sale()
      ..id = row.id_sale
      ..nameBuyer = row.namebuyer
      ..DNI = row.dni
      ..RUC = row.ruc
      ..address = row.address
      ..voucher = row.voucher
      ..priceTotal = row.pricetotal
      ..dateSale =row.datesale;
    findProductsByIdSale(s.id).then((List<Product> lista){s.listProduct = lista;});
    return s;
  }
  
  int mapRowToInt(pg.Row row){
    return row.id_product;
  }
}

