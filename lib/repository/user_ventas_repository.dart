import 'dart:async';
import 'package:di/di.dart';

import 'package:postgresql/postgresql.dart' as pg;
import '../config/db_connection.dart';
import '../model/user.dart';

class UserVentasRepository {
  DbConnection connection;

  UserVentasRepository(this.connection);

  Future<User> find(int id) async {
    User user = (await connection.query('SELECT * FROM "user_ventas" WHERE id_vendedor = @id AND user_type=4', {'id': id})).map(mapRowToUser).first;
    return user;
  }

  Future<List<User>> find_name(String name) async {
    return (await connection.query('SELECT * FROM "user_ventas" WHERE first_name = @name AND user_type=4', {'name': name})).map(mapRowToUser).toList();
  }

  Future<List<User>> findAll() async {
    return (await connection.query('SELECT * FROM "user" WHERE user_type=4')).map(mapRowToUser).toList();
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
