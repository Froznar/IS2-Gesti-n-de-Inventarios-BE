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

    Future<List<SaleProduct>> getByProduct(int id_product){
        return saleProductRepository.findByIdSale(id_product);
    }

    Future<SaleProduct> setSaleProduct(String data) {
        List<String> new_data = data.split("-");
        if(new_data.length == 4){
            return saleProductRepository.registerSaleProduct(new_data[0],new_data[1],new_data[2],new_data[3]);
        }
    }
}