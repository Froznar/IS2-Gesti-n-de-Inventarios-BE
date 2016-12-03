import 'dart:async';
import 'package:di/di.dart';

import 'package:postgresql/postgresql.dart' as pg;
import '../config/db_connection.dart';
import '../model/client.dart';

class ClientRepository {
  DbConnection connection;

  ClientRepository(this.connection);

 Future<List<Client>> findAll() async {
    return (await connection.query('SELECT * FROM "client"')).map(mapRowToClient).toList();
  }

  //Busqueda Venta por Comprador
  Future<Client> findClientName(String first_name) async {
    Client client = (await connection.query('SELECT * FROM "client" WHERE first_name = @first_name', {'first_name':first_name})).map(mapRowToClient).first;
    return client;
  }

  //Insertar Cliente

  Future<Client> registerClient(String first_name,String last_name,String dni1, String ruc1,String client_type1 ) async{
    int dni=int.parse(dni1);
    int ruc=int.parse(ruc1);
    int client_type=int.parse(client_type1);
    await connection.query('INSERT INTO "client" (first_name,last_name,dni,ruc,client_type) values (@first_name,@last_name,@dni,@ruc,@client_type)', {'first_name':first_name,'last_name':last_name,'dni':dni ,'ruc':ruc, 'client_type':client_type});
    return findClientName(first_name);
  }

  Client mapRowToClient(pg.Row row) {
    return new Client()
      ..id = row.id
      ..first_name = row.first_name
      ..last_name = row.last_name
      ..dni=row.dni
      ..ruc=row.ruc
      ..client_type = row.client_type;
  }

}