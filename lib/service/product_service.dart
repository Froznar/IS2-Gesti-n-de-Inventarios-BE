import '../repository/product_repository.dart';
import '../model/product.dart';
import 'dart:async';

class ProductService {
  ProductRepository productRepository;
  ProductService(this.productRepository);

  Future<Product> get(int id) {
    return productRepository.find(id);
  }

  Future<List<Product>> getAll() {
    return productRepository.findAll();
  }

  Future<Product> getProductName(String name) {
    return productRepository.findProductName(name);
  }

  Future<Product> setProduct(String data){
    List<String> new_data = data.split("-");
    if(new_data.length == 7){
      return productRepository.registerProduct(new_data[0], new_data[1], new_data[2], new_data[3], new_data[4], new_data[5], new_data[6]);
    }
  }

  /*Funcion para Acceder*/
  Future<Product> getSaleId(int id) {
    return productRepository.findSaleId(id);
  }
}
