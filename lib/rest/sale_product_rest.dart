import 'dart:async';
import 'package:rpc/rpc.dart';

import '../model/sale_product.dart';
import '../service/sale_product_service.dart';

@ApiClass(name: 'sale_product', version: 'v1', description: 'Sale_product server side API')
class SaleProductRest{
    SaleProductService saleProductService;
    SaleProductRest(this.saleProductService);

    @ApiMethod(path: 'sale_product/{id}')
    Future<SaleProduct> getSaleProduct (String id){
        return saleProductService.get(int.parse(id));
    }

    @ApiMethod(path: 'all')
    Future<List<SaleProduct>> getSaleProducts (){
        return saleProductService.getAll();
    }

    @ApiMethod(path: 'sale_product_by_sale/{id_sale}')
    Future<List<SaleProduct>> getSaleProductsBySale (String id_sale){
        return saleProductService.getBySale(int.parse(id_sale));
    }

    /*Manera de insertar localhost:9090/sale_product/v1/sale_product_insert/2-1-5-13.10*/
    @ApiMethod(path: 'sale_product_insert/{data}')
    Future<bool> insertSale(String data) {
        return saleProductService.setSaleProduct(data);
    }
}