import 'dart:async';
import 'package:rpc/rpc.dart';

import '../service/provider_service.dart';
import '../model/provider.dart';

@ApiClass(name: 'provider', version: 'v1', description: 'User server side API')
class ProviderRest {
  ProviderService providerService;

  ProviderRest(this.providerService);

  @ApiMethod(path: 'provider/{id}')
    Future<Provider> getProvider(String id) {
      print("pasee");
      return providerService.get(int.parse(id));
  }

  @ApiMethod(path: 'provider/name/{name}')
  Future<List<Provider>> get_nameProvider(String name) {
    return providerService.get_name(name);
  }

/*Manera de insertar /dato1-dato2-dato3-dato4-dato5 cada dato separado por guiones*/
  @ApiMethod(path: 'provider/insert/{data}')
  Future<Provider> insertProvider(String data) {
    return providerService.insert(data);
  }
  
  @ApiMethod(path: 'all')
  Future<List<Provider>> getProvideres() {
    return providerService.getAll();
  }
}
