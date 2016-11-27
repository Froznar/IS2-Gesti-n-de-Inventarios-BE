import 'dart:async';
import 'package:postgresql/postgresql.dart' as pg;
import '../config/db_connection.dart';
import '../model/sale_product.dart';

class SaleProductRepository{
    DbConnection connection;
    SaleProductRepository(this.connection);
    Future<SaleProduct> find(int id) async {
        SaleProduct saleProduct = (await connection.query('select * from sale_product where id_sale_product = @id;', {'id': id})).map(mapRowToSaleProduct).first();
        return saleProduct;
    }

    Future<List<SaleProduct>> findAll () async {
        return (await connection.query('select * from sale_product;')).map(mapRowToSaleProduct).toList();
    }

    Future<List<SaleProduct>> findByIdSale (int id_sale) async {//obtener todas las sales_product de una venta
        List<SaleProduct> list = (await connection.query('select * from sale_product where id_sale = @id_sale;', {'id_sale': id_sale})).map(mapRowToSaleProduct).toList();
        return list;
    }

    SaleProduct mapRowToSaleProduct(pg.Row row){
        return new SaleProduct()
            ..id_sale_product = row.id_sale_product
            ..id_sale = row.id_sale
            ..id_product = row.id_product
            ..cantidad = row.cantidad
            ..priceUnit = double.parse(row.precio_unidad);
    }
}
