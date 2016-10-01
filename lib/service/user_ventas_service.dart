import '../repository/user_ventas_repository.dart';
import '../model/vendedor.dart';
import 'dart:async';

class UserVentasService {
  UserVentasRepository userRepository;
  UserVentasService(this.userRepository);

  Future<Vendedor> get(int id) {
    return userRepository.find(id);
  }

  Future<List<Vendedor>> get_name(String name) {
    return userRepository.find_name(name);
  }

  Future<List<Vendedor>> getAll() {
    return userRepository.findAll();
  }
}