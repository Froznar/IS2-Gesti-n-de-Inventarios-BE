import '../repository/type_product_repository.dart';
import '../model/product_type.dart';
import 'dart:async';

class ProductTypeService {
  ProductTypeRepository productTypeRepository;
  ProductTypeService(this.productTypeRepository);

  Future<ProductType> get(int id) {
    return productTypeRepository.find(id);
  }

}

 
