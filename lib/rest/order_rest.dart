import 'dart:async';
import 'package:rpc/rpc.dart';

import '../service/order_service.dart';
import '../model/order.dart';
import '../model/quantity.dart';

@ApiClass(name: 'order', version: 'v1', description: 'Order server side API')
class OrderRest {
  OrderService orderService;

  OrderRest(this.orderService);

  @ApiMethod(path: 'order/{id}')
  Future<Order> getOrder(String id) {
    return orderService.get(int.parse(id));
  }

  @ApiMethod(path: 'order/date/{date}')
  Future<List<Order>> getOrderDate(String date){
    return orderService.getDate(date);
  }

  @ApiMethod(path: 'order/date/month/{month}')
  Future<List<Order>> getOrderDateByMonth(String month){
    return orderService.getDateByMonth(int.parse(month));
  }

  @ApiMethod(path: 'order/received/month/{month}')
  Future<List<Order>> getReceivedOrderByMonth(String month){
    return orderService.getReceivedByMonth(int.parse(month));
  }

  @ApiMethod(path: 'order/sent/month/{month}')
  Future<List<Order>> getSentOrderByMonth(String month){
    return orderService.getSentByMonth(int.parse(month));
  }
  
  @ApiMethod(path: 'order/pending/month/start/{month}')
  Future<List<Order>> getPendingOrderByMonthStart(String month){
    return orderService.getPendingByMonthStart(int.parse(month));
  }

  @ApiMethod(path: 'order/pending/month/end/{month}')
  Future<List<Order>> getPendingOrderByMonthEnd(String month){
    return orderService.getPendingByMonthEnd(int.parse(month));
  }  
  
  @ApiMethod(path: 'order/received/ontime')
  Future<List<Order>> getReceivedOrderOnTime(){
    return orderService.getReceivedOnTime();
  }    

  @ApiMethod(path: 'order/received/late')
  Future<List<Order>> getReceivedOrderLate(){
    return orderService.getReceivedLate();
  }  

  @ApiMethod(path: 'order/received/late/count')
  Future<Num> getReceivedOrderLateCount(){
    return orderService.getReceivedLateCount();
  }  

  @ApiMethod(path: 'order/received/late/percentage')
  Future<Percentage> getReceivedOrderLatePercentage(){
    return orderService.getReceivedLatePercentage();
  } 
  
  @ApiMethod(path: 'all')
  Future<List<Order>> getOrders() {
    return orderService.getAll();
  }
}
