import 'dart:async';
import 'package:rpc/rpc.dart';

import '../service/user_service.dart';
import '../model/user.dart';

@ApiClass(name: 'user', version: 'v1', description: 'User server side API')
class UserRest {
  UserService userService;

  UserRest(this.userService);

  @ApiMethod(path: 'user/{id}')
  Future<User> getUser(String id) {
    return userService.get(int.parse(id));
  }

  @ApiMethod(path: 'user/account/{account}')
  Future<User> getUserAccount(String account){
    return userService.getAccount(account);
  }

  @ApiMethod(path: 'all')
  Future<List<User>> getUsers() {
    return userService.getAll();
  }
}
