import '../repository/client_repository.dart';
import '../model/client.dart';
import 'dart:async';

class ClientService {
  ClientRepository clientRepository;
  ClientService(this.clientRepository);

  Future<Client> get(int id) {
    return clientRepository.find(id);
  }


  Future<List<Client>> getAll() {
    return clientRepository.findAll();
  }
}
