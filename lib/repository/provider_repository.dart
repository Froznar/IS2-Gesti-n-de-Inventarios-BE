import 'dart:async';
import 'package:di/di.dart';

import 'package:postgresql/postgresql.dart' as pg;
import '../config/db_connection.dart';
import '../model/provider.dart';

class ProviderRepository {
  DbConnection connection;

  ProviderRepository(this.connection);

  Future<Provider> find(int id) async {
    Provider provider = (await connection.query('SELECT * FROM "provider" WHERE id_provider = @id', {'id': id})).map(mapRowToProvider).first;
    return provider;
  }

  Future<Provider> find_phone(String phone) async {
    Provider provider = (await connection.query('SELECT * FROM "provider" WHERE phone = @phone', {'phone': phone})).map(mapRowToProvider).first;
    return provider;
  }



  Future<List<Provider>> find_name(String name) async {
    return (await connection.query('SELECT * FROM "provider" WHERE name_provider = @name', {'name': name})).map(mapRowToProvider).toList();
  }

  Future<List<Provider>> findAll() async {
    return (await connection.query('SELECT * FROM "provider" ')).map(mapRowToProvider).toList();
  }

  Future<Provider> createProvider(String name_provider, String ruc, String email, String address, String phone) async{
    await connection.query('INSERT INTO "provider" (name_provider, ruc, email, address, "phone") values (@name_provider, @ruc, @email, @address, @phone)', {'name_provider':name_provider, 'ruc':ruc, 'email':email, 'address':address, 'phone':phone});
    return find_phone(phone);
  }

  Provider mapRowToProvider(pg.Row row) {
    return new Provider()
      ..id_provider = row.id_provider
      ..name_provider = row.name_provider
      ..address = row.address
      ..RUC = row.ruc
      ..email = row.email
      ..phone = row.phone;
  }
}
