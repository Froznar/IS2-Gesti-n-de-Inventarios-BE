import '../repository/order_repository.dart';
import '../model/order.dart';
import 'dart:async';

class OrderService {
  OrderRepository orderRepository;
  OrderService(this.orderRepository);

  Future<Order> get(int id) {
    return orderRepository.find(id);
  }

  Future<List<Order>> getDate(String date){
    return orderRepository.findDate(date);
  }

  Future<List<Order>> getDateByMonth(int month){
    return orderRepository.findDateByMonth(month);
  }
  
  Future<List<Order>> getReceivedByMonth(int month){
    return orderRepository.findReceivedByMonth(month);
  }

  Future<List<Order>> getSentByMonth(int month){
    return orderRepository.findSentByMonth(month);
  }

  Future<List<Order>> getPendingByMonthStart(int month){
    return orderRepository.findPendingByMonthStart(month);
  }
  
  Future<List<Order>> getPendingByMonthEnd(int month){
    return orderRepository.findPendingByMonthEnd(month);
  }  

  Future<List<Order>> getAll() {
    return orderRepository.findAll();
  }
}
