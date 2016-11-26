import 'dart:async';
import 'package:rpc/rpc.dart';

import '../service/client_service.dart';
import '../model/client.dart';
@ApiClass(name: 'client', version: 'v1', description: 'User server side API')
class ClientRest {
  ClientService clientService;

  ClientRest(this.clientService);

  @ApiMethod(path: 'client/{id}')
  Future<Client> getUser(String id) {
    return clientService.get(int.parse(id));
  }

  @ApiMethod(path: 'all')
  Future<List<Client>> getUsers() {
    return clientService.getAll();
  }
}
