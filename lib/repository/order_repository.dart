import 'dart:async';
import 'package:di/di.dart';

import 'package:postgresql/postgresql.dart' as pg;
import '../config/db_connection.dart';
import '../model/order.dart';
import 'dart:convert';

class OrderRepository {
  DbConnection connection;

  OrderRepository(this.connection);

  Future<Order> find(int id) async {
    Order order = (await connection.query('SELECT * FROM "Order" WHERE id_order = @id', {'id': id})).map(mapRowToOrder).first;
    return order;
  }

  Future<List<Order>> findDate(String sDate) async {
    DateTime date = DateTime.parse(sDate);
    List<Order> order = (await connection.query('SELECT * FROM "Order" WHERE order_date = @date', {'date':date})).map(mapRowToOrder).toList();
    return order;
  }

  Future<List<Order>> findDateByMonth(int month) async {
    List<Order> order = (await connection.query('SELECT * FROM "Order" WHERE Extract(month from order_date) = @month', {'month':month})).map(mapRowToOrder).toList();
    return order;
  }

  Future<List<Order>> findReceivedByMonth(int month) async {
    List<Order> order = (await connection.query('SELECT * FROM "Order" WHERE Extract(month from order_date) = @month and order_state = 1', {'month':month})).map(mapRowToOrder).toList();
    return order;
  }

  Future<List<Order>> findSentByMonth(int month) async {
    List<Order> order = (await connection.query('SELECT * FROM "Order" WHERE Extract(month from order_date) = @month and order_state = 0', {'month':month})).map(mapRowToOrder).toList();
    return order;
  }
  
  Future<List<Order>> findPendingByMonthStart(int month) async {
    List<Order> order = (await connection.query('SELECT * FROM "Order" WHERE Extract(month from order_date) = @month and order_state = 2 and Extract(day from order_date) < 10', {'month':month})).map(mapRowToOrder).toList();
    return order;
  }
  
  Future<List<Order>> findPendingByMonthEnd(int month) async {
    List<Order> order = (await connection.query('SELECT * FROM "Order" WHERE Extract(month from order_date) = @month and order_state = 2 and Extract(day from order_date) > 20', {'month':month})).map(mapRowToOrder).toList();
    return order;
  }

  Future<List<Order>> findAll() async {
    return (await connection.query('SELECT * FROM "Order"')).map(mapRowToOrder).toList();
  }

  Order mapRowToOrder(pg.Row row) {
    return new Order()
      ..id_order = row.id_order
      ..id_provider = row.id_provider
      ..id_client = row.id_client
      ..id_product = row.id_product
      ..order_state = row.order_state
      ..order_date = row.order_date;
  }
}
