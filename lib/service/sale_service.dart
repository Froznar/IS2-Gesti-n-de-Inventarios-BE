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

  Future<Sale> getSaleBuyer(String name) {
    return saleRepository.findSaleBuyer(name);
  }

    Future<List<Sale>> getAllDateSale(String fecha) {
	List<String>fechas=["",""];
	int b=0;
	for(int a=0;a<fecha.length;a++){
	    if(fecha[a]=="%"){
		b++;
		a=a+3;
	    }
	    fechas[b]=fechas[b]+fecha[a];
	}
	
    return saleRepository.findSaleDate(fechas[0],fechas[1]);
  }

  Future<Sale> setSale(String data) {
    List<String>new_data= ["", "","","","","",""];
    int b=0;
    for(int a=0;a<data.length;a++){
      if(data[a]=="-"){
        b++;
        a++;
      }
      new_data[b]=new_data[b]+data[a];
    }
    return saleRepository.registerSale(new_data[0],new_data[1],new_data[2],new_data[3],new_data[4],new_data[5],new_data[6]);
  }
}
