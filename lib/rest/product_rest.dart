import 'dart:async';
import 'package:rpc/rpc.dart';

import '../service/product_service.dart';
import '../model/product.dart';

@ApiClass(name: 'product', version: 'v1', description: 'Product server side API')
class ProductRest {
  ProductService productService;

  ProductRest(this.productService);

  @ApiMethod(path: 'product/{id}')
  Future<Product> getProduct(String id) {
    return productService.get(int.parse(id));
  }

  @ApiMethod(path: 'all')
  Future<List<Product>> getAllProducts() {
    return productService.getAll();
  }


}
