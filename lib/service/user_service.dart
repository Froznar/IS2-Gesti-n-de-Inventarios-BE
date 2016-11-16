import '../repository/user_repository.dart';
import '../model/user.dart';
import 'dart:async';

class UserService {
  UserRepository userRepository;
  UserService(this.userRepository);

  Future<User> get(int id) {
    return userRepository.find(id);
  }

  Future<User> getAccount(String account){
    return userRepository.findAccount(account);
  }

  Future<List<User>> getAll() {
    return userRepository.findAll();
  }
}
