import '../repository/user_product_register_repository.dart';
import '../model/user.dart';
import 'dart:async';

class User_Product_Register_Service {
  User_Product_Register_Repository user_product_register_repository;
  User_Product_Register_Service(this.user_product_register_repository);

  Future<User> get(int id) {
    return user_product_register_repository.find(id);
  }

  Future<User> getByAccount(String account) {
    return user_product_register_repository.findAccount(account);
  }

  Future<List<User>> getAll() {
    return user_product_register_repository.findAll();
  }

  Future<User> createUser(String first_name, String last_name, String email, String account, String password){
    return user_product_register_repository.createUser(first_name, last_name, email, account, password);
  }
}