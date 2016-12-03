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

  /*Manera de insertar localhost:9090/sale/v1/saleInsert/SuperMan-123456-987654-Springfield-voucher2-185-now*/
  @ApiMethod(path: 'saleInsert/{data}')
  Future<Sale> insertSale(String data) {
    return saleService.setSale(data);
  }

  @ApiMethod(path: 'lastSale')
  Future<Sale> getLastSale() {
    return saleService.getLastSale();
  }

}
