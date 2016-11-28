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

  @ApiMethod(path: 'product_warehouse/{id_warehouse}')
  Future<List<Product>> getProductByWarehouseId(String id_warehouse) {
   return productService.getByWarehouseId(int.parse(id_warehouse));
  }

  @ApiMethod(path: 'all')
  Future<List<Product>> getAllProducts() {
    return productService.getAll();
  }

  @ApiMethod(path: 'productName/{name}')
  Future<Product> getAllProductName(String name) {
    return productService.getProductName(name);
  }
}
