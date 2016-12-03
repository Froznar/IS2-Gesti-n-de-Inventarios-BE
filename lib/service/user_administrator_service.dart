import '../repository/user_administrator_repository.dart';
import '../model/user.dart';
import 'dart:async';

class User_Administrator_Service {
  User_Administrator_Repository user_administrator_repository;
  User_Administrator_Service(this.user_administrator_repository);

  Future<User> get(int id) {
    return user_administrator_repository.find(id);
  }

  Future<List<User>> getAll() {
    return user_administrator_repository.findAll();
  }

  Future<User> getEmail(String email) {
    return user_administrator_repository.find_email(email);
  }

  Future<User> insert(String data) {
    print("SApeee2");
    List<String>new_data= ["", "","","","",""];
    int b=0;
    for(int a=0;a<data.length;a++){
      if(data[a]=="-"){
        b++;
        a++;
      }
      new_data[b]=new_data[b]+data[a];
    }
    user_administrator_repository.createUser(new_data[0],new_data[1],new_data[3],new_data[2],new_data[4],new_data[5]);
  }
  Future<User> updateUser(String data) {
    print("SApeee");
    List<String>new_data= ["","","","","","",""];
    int b=0;
    for(int a=0;a<data.length;a++){
      if(data[a]=="-"){
        b++;
        a++;
      }
      new_data[b]=new_data[b]+data[a];
    }
    int id=int.parse(new_data[6]);
    print("SApeee2");
    user_administrator_repository.updateExistingUser(new_data[0],new_data[1],new_data[3],new_data[2],new_data[4],new_data[5],id);
  }
}
