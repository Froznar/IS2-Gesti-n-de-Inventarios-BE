import 'dart:async';
import 'package:di/di.dart';

import 'package:postgresql/postgresql.dart' as pg;
import '../config/db_connection.dart';
import '../model/user.dart';

class User_Product_Register_Repository {
  DbConnection connection;

  User_Product_Register_Repository(this.connection);

  Future<User> find(int id) async {
    User user = (await connection.query('SELECT * FROM "user" WHERE id = @id AND user_type=1', {'id': id})).map(mapRowToUser).first;
    return user;
  }

  Future<User> findAccount(String account) async {
    User user = (await connection.query('SELECT * FROM "user" WHERE account = @account AND user_type=1', {'account':account})).map(mapRowToUser).first;
    return user;
  }

  Future<User> createUser(String first_name, String last_name, String email, String account, String password) async{
    await connection.query('INSERT INTO "user" (first_name, last_name, email, account, "password", user_type) values (@first_name, @last_name, @email, @account, @password, 1)', {'first_name':first_name, 'last_name':last_name, 'email':email, 'account':account, 'password':password});
    //User user = (await connection.query('SELECT * FROM "user" WHERE account = @account AND user_type=1', {'account':account})).map(mapRowToUser).first;
    //return user;
    return findAccount(account);
  }

  Future<List<User>> findAll() async {
    return (await connection.query('SELECT * FROM "user" WHERE user_type=1')).map(mapRowToUser).toList();
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
