import 'dart:async';
import 'package:rpc/rpc.dart';

import '../service/client_service.dart';
import '../model/client.dart';
@ApiClass(name: 'client', version: 'v1', description: 'User server side API')
class ClientRest {
  ClientService clientService;

  ClientRest(this.clientService);

  @ApiMethod(path: 'all')
  Future<List<Client>> getClients() {
    return clientService.getAll();
  }

  @ApiMethod(path: 'clientName/{name}')
  Future<Client> getClientName(String name) {
    return clientService.getClientName(name);
  }

  /*Manera de insertar http://localhost:9090/client/v1/clientInsert/juanita-loza-123456-987654-0*/
  @ApiMethod(path: 'clientInsert/{data}')
  Future<Client> insertClient(String data) {
    return clientService.setClient(data);
  }
}