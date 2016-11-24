import '../model/product.dart';

class Sale {
  int id;
  String nameBuyer;
  int DNI;
  int RUC;
  String address;
  String voucher;
  List<Product> listProduct;
  int priceTotal;
  DateTime dateSale;
}
class Sale2 {
  int id;
  String nameBuyer;
  int DNI;
  int RUC;
  String address;
  String voucher;
  Product product;
  int priceTotal;
  DateTime dateSale;
}
