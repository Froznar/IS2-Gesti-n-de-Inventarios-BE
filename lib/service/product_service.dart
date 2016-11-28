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
}
