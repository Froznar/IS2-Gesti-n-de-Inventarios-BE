import '../repository/sale_repository.dart';
import '../model/sale.dart';
import 'dart:async';

class SaleService {
  SaleRepository saleRepository;
  SaleService(this.saleRepository);

  Future<Sale> get(int id) {
    return saleRepository.find(id);
  }

  Future<List<Sale>> getAll() {
    return saleRepository.findAll();
  }


}
