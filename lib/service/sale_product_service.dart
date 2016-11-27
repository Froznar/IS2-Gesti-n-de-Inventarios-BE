import '../model/sale_product.dart';
import '../repository/sale_product_repository.dart';
import 'dart:async';

class SaleProductService{
    SaleProductRepository saleProductRepository;
    SaleProductService(this.saleProductRepository);

    Future<SaleProduct> get(int id){
        return saleProductRepository.find(id);
    }

    Future<List<SaleProduct>> getAll(){
        return saleProductRepository.findAll();
    }
    Future<List<SaleProduct>> getBySale(int id_sale){
        return saleProductRepository.findByIdSale(id_sale);
    }
}