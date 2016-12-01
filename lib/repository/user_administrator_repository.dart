import 'dart:async';
import 'package:di/di.dart';

import 'package:postgresql/postgresql.dart' as pg;
import '../config/db_connection.dart';
import '../model/user.dart';

class User_Administrator_Repository {
  DbConnection connection;

  User_Administrator_Repository(this.connection);

  Future<User> find(int id) async {
    User user = (await connection.query('SELECT * FROM "user" WHERE id = @id AND user_type=3', {'id': id})).map(mapRowToUser).first;
    return user;
  }

  /*General Find */
  Future<List<User>> findAll() async {
    return (await connection.query('SELECT * FROM "user" WHERE user_type=3')).map(mapRowToUser).toList();
  }
  /*Find email*/
  Future<User> find_email(String email) async {
    User user = (await connection.query('SELECT * FROM "user" WHERE email = @email AND user_type=3', {'email': email})).map(mapRowToUser).first;
    return user;
  }

  Future<Null> createUser(String first_name,String last_name,String email,String account,String password,String user_type) async{
    if(user_type =='1') {
      await connection.query('INSERT INTO "user" (first_name,last_name, email, account, password,user_type) values (@first_name, @last_name, @email, @account, @password, 1)',
          {'first_name':first_name, 'last_name':last_name, 'email':email, 'account':account, 'password':password, 'user_type':user_type});
    }
    if(user_type == '2') {
      await connection.query('INSERT INTO "user" (first_name,last_name, email, account, password,user_type) values (@first_name, @last_name, @email, @account, @password, 2)',
          {'first_name':first_name, 'last_name':last_name, 'email':email, 'account':account, 'password':password, 'user_type':user_type});
    }
    if(user_type == '3') {
      await connection.query('INSERT INTO "user" (first_name,last_name, email, account, password,user_type) values (@first_name, @last_name, @email, @account, @password, 3)',
          {'first_name':first_name, 'last_name':last_name, 'email':email, 'account':account, 'password':password, 'user_type':user_type});
    }
  }

  Future<Null> updateExistingUser(String first_name,String last_name,String email,String account,String password,String user_type,int id) async {
    if(user_type =='1') {
      await connection.query('UPDATE "user" set first_name=@first_name, last_name=@lastname, email=@email, account=@account, password=@password, user_type=1 where id=@id; values (@first_name, @last_name, @email, @account, @password, 1)',
          {'first_name':first_name, 'last_name':last_name, 'email':email, 'account':account, 'password':password, 'id':id});
    }
    if(user_type == '2') {
      await connection.query('UPDATE "user" set first_name=@first_name, last_name=@lastname, email=@email, account=@account, password=@password, user_type=2 where id=@id; values (@first_name, @last_name, @email, @account, @password, 1)',
          {'first_name':first_name, 'last_name':last_name, 'email':email, 'account':account, 'password':password, 'id':id});
    }
    if(user_type == '3') {
      await connection.query('UPDATE "user" set first_name=@first_name, last_name=@lastname, email=@email, account=@account, password=@password, user_type=3 where id=@id; values (@first_name, @last_name, @email, @account, @password, 1)',
          {'first_name':first_name, 'last_name':last_name, 'email':email, 'account':account, 'password':password, 'id':id});
    }
  }

  User mapRowToUser(pg.Row row) {
    return new User()
      ..id = row.id
      ..first_name = row.first_name
      ..last_name = row.last_name
      ..email = row.email
      ..account = row.account
      ..password = row.password
      ..user_type = row.user_type;
  }
}
