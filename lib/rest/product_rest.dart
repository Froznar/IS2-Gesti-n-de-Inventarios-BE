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

  @ApiMethod(path: 'available_products')
  Future<List<Product>> availableProducts() {
   return productService.getAvailableProducts();
  }

  @ApiMethod(path: 'all')
  Future<List<Product>> getAllProducts() {
    return productService.getAll();
  }

  @ApiMethod(path: 'productName/{name}')
  Future<Product> getAllProductName(String name) {
    return productService.getProductName(name);
  }

  /*Manera de insertar localhost:9090/product/v1/product_insert/Pintura-15.90-5-1-1-23-1123*/
  @ApiMethod(path: 'product_insert/{data}')
  Future<Product> insertProduct(String data) {
    return productService.setProduct(data);
  }


  /*Funcion para Acceder*/
  @ApiMethod(path: 'saleId/{id}')
  Future<Product> getSaleId(int id) {
    return productService.getSaleId(id);
  }

  @ApiMethod(path: 'lastProduct')
  Future<Product> getLastProduct() {
    return productService.getLastProduct();
  }
}
