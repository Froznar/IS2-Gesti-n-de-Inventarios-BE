import '../repository/user_ventas_repository.dart';
import '../model/user.dart';
import 'dart:async';
import 'sale_service.dart';
import 'sale_product_service.dart';

class UserVentasService {
  UserVentasRepository userRepository;
  UserVentasService(this.userRepository);
  SaleService saleService;
    Future<User> get(int id) {
	
    return userRepository.find(id);
  }

  Future<List<User>> get_nameUser_ventas(String name) {
    return userRepository.find_name(name);
  }

    Future<List<List<String>>> get_report(String fecha) {
	List<List<String>>reporte;
	List<Sale>ventas= saleService.getAllDateSale(fecha);
/*	for(int a=0;a<ventas.length;a++){
	    List<SaleProduct>productos=getBySale(1));
	    reporte[0][0]=String.parse(productos[0]->id_sale_product);
	}*/
		
	return reporte;
  }

    
  Future<List<User>> getAll() {
    return userRepository.findAll();
  }
}
