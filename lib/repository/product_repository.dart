import 'dart:async';
import 'package:postgresql/postgresql.dart' as pg;
import '../config/db_connection.dart';
import '../model/product.dart';

class ProductRepository
{
  DbConnection connection;

  ProductRepository(this.connection);

//  Seleccion por Id de Product
  Future<Product> find(int id) async {
    Product product = (await connection.query( 'SELECT * FROM "product" WHERE id_product = @id', {'id': id})) .map(mapRowToProduct) .first;
    return product;
  }

//General Find Product
  Future<List<Product>> findAll() async {
    return (await connection.query('SELECT * FROM "product" ')).map( mapRowToProduct).toList();
  }

  //Seleccionar Nombres de Productos
  Future<Product> findProductName(String name) async {
    return (await connection.query('SELECT * FROM "product" WHERE name_product = @name', {'name':name})).map(mapRowToProduct).first;
  }

  Future<Product> registerProduct(String name_product, String price, String stock, String grupo, String subgrupo, String cod_item, String codigo) async{
    await connection.query('insert into product (name_product, price, stock, grupo, subgrupo, cod_item, codigo) values (@name_product, @price, @stock, @grupo, @subgrupo, @cod_item, @codigo);', {'name_product':name_product,'price':double.parse(price), 'stock': stock, 'grupo':grupo, 'subgrupo':subgrupo, 'cod_item':cod_item, 'codigo':codigo});
    return findProductName(name_product);
  }

  /*Agregando Producto Repositorio*/
  Product mapRowToProduct(pg.Row row) {
    return new Product()
      ..id = row.id_product
      ..nameProduct = row.name_product
      ..price = double.parse(row.price)
      ..stock = row.stock
      ..grupo = row.grupo
      ..subgrupo = row.subgrupo
      ..codItem = row.cod_item
      ..codigo = row.codigo;
  }

  String mapRowToString(pg.Row row) {
    return  row.name_product;
  }
}