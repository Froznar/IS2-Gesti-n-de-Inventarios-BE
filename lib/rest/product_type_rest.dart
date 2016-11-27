import 'dart:async';
import 'package:rpc/rpc.dart';

import '../service/product_type_service.dart';
import '../model/product_type.dart';

@ApiClass(name: 'product_type', version: 'v1', description: 'User server side API')
class ProductTypeRest {
  ProductTypeService productTypeService;

  ProductTypeRest(this.productTypeService);

  @ApiMethod(path: 'product_type/{id}')
  Future<ProductType> getProductType(String id) {
  		     print("pase nash");
    return productTypeService.get(int.parse(id));
  }
  
}
