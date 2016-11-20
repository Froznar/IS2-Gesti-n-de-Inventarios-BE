import '../repository/provider_repository.dart';
import '../model/provider.dart';
import 'dart:async';

class ProviderService {
  ProviderRepository providerRepository;
  ProviderService(this.providerRepository);

  Future<Provider> get(int id) {
    return providerRepository.find(id);
  }

  Future<List<Provider>> get_name(String name) {
    return providerRepository.find_name(name);
  }

  Future<List<Provider>> getAll() {
    return providerRepository.findAll();
  }

  Future<Provider> insert(String data) {
    List<String>new_data= ["ab", "abc","abcd","abcde","ewq"];
  /*  int b=0;
    for(int a=0;a<data.length;a++){
      if(data[a]=="%"){
        b++;
	a++;
      }
      new_data[b]=data[a]; 
    }*/
    new_data[0]=data;
    return providerRepository.createProvider(new_data[0],new_data[1],new_data[2],new_data[3],new_data[4]);
 }
 
}