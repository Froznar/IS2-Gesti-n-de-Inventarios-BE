import 'dart:async';
import 'package:rpc/rpc.dart';

import '../service/user_ventas_service.dart';
import '../model/user.dart';

@ApiClass(name: 'user_ventas', version: 'v1', description: 'User server side API')
class UserVentasRest {
  UserVentasService User_ventasService;

  UserVentasRest(this.User_ventasService);

  @ApiMethod(path: 'user_ventas/{id}')
  Future<User> getUser(String id) {
    return User_ventasService.get(int.parse(id));
  }

  @ApiMethod(path: 'user_ventas/name/{name}')
  Future<List<User>> get_nameUser_ventas(String name) {
    return User_ventasService.get_nameUser_ventas(name);
  }

  @ApiMethod(path: 'all')
  Future<List<User>> getUser_ventas() {
    return User_ventasService.getAll();
  }
}