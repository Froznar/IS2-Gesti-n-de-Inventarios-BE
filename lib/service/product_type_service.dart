import '../repository/product_type_repository.dart';
import '../model/product_type.dart';
import 'dart:async';

class ProductTypeService {
  ProductTypeRepository productTypeRepository;
  ProductTypeService(this.productTypeRepository);

  Future<ProductType> get(int id) {
      print("Estoy en servide");
      return productTypeRepository.find(id);
  }

}

