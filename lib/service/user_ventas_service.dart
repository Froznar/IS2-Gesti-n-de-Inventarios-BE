import '../repository/user_ventas_repository.dart';
import '../model/user.dart';
import 'dart:async';

class UserVentasService {
  UserVentasRepository userRepository;
  UserVentasService(this.userRepository);

  Future<User> get(int id) {
    return userRepository.find(id);
  }

  Future<List<User>> get_nameUser_ventas(String name) {
    return userRepository.find_name(name);
  }

  Future<List<User>> getAll() {
    return userRepository.findAll();
  }
}