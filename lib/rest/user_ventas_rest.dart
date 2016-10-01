import 'dart:async';
import 'package:rpc/rpc.dart';

import '../service/user_ventas_service.dart';
import '../model/vendedor.dart';

@ApiClass(name: 'vendedor', version: 'v1', description: 'User server side API')
class UserVentasRest {
  UserVentasService vendedorService;

  UserVentasRest(this.vendedorService);

  @ApiMethod(path: 'vendedor/{id}')
  Future<Vendedor> getVendedor(String id) {
    return vendedorService.get(int.parse(id));
  }

  @ApiMethod(path: 'vendedor/name/{name}')
  Future<List<Vendedor>> get_nameVendedor(String name) {
    return vendedorService.get_name(name);
  }

  @ApiMethod(path: 'all')
  Future<List<Vendedor>> getVendedores() {
    return vendedorService.getAll();
  }
}