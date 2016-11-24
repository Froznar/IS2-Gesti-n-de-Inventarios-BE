import 'dart:async';
import 'package:rpc/rpc.dart';

import '../service/sale_service.dart';
import '../model/sale.dart';

@ApiClass(name: 'sale', version: 'v1', description: 'Sale server side API')
class SaleRest {
  SaleService saleService;

  SaleRest(this.saleService);

  @ApiMethod(path: 'sale/{id}')
  Future<Sale> getSale(String id) {
    return saleService.get(int.parse(id));
  }

  @ApiMethod(path: 'all')
  Future<List<Sale>> getAllSale() {
    return saleService.getAll();
  }

  @ApiMethod(path: 'saleBuyer/{name}')
  Future<Sale> getSaleBuyer(String name) {
    return saleService.getSaleBuyer(name);
  }
}