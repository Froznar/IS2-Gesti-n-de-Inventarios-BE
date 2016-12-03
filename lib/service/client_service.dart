import '../repository/client_repository.dart';
import '../model/client.dart';
import 'dart:async';

class ClientService {
  ClientRepository clientRepository;
  ClientService(this.clientRepository);

  Future<List<Client>> getAll() {
    return clientRepository.findAll();
  }

  Future<Client> getClientName(String name) {
    return clientRepository.findClientName(name);
  }

  Future<Client> setClient(String data) {
    List<String>new_data= ["", "","","",""];
    int b=0;
    for(int a=0;a<data.length;a++){
      if(data[a]=="-"){
        b++;
        a++;
      }
      new_data[b]=new_data[b]+data[a];
    }
    return clientRepository.registerClient(new_data[0],new_data[1],new_data[2],new_data[3],new_data[4]);
  }
}