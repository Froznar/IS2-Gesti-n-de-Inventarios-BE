import 'dart:async';
import 'package:rpc/rpc.dart';

import '../service/user_ventas_service.dart';
import '../model/user.dart';

@ApiClass(name: 'user_ventas', version: 'v1', description: 'User server side API')
class UserVentasRest {
  UserVentasService userService;

  UserVentasRest(this.userService);

  @ApiMethod(path: 'user_ventas/{id}')
  Future<User> getUser(String id) {
    return userService.get(int.parse(id));
  }

  @ApiMethod(path: 'all')
  Future<List<User>> getUsers() {
    return userService.getAll();
  }
}