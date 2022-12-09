import 'package:flutter/cupertino.dart';

class Store with ChangeNotifier {
  String connect = 'connected';
  int count = 0;
  int sum = 0;
  int sumAll = 0;

  void increaseCount(index) {
    count = index['count'];

    if (count >= 0) {
      count++;
      sum = count * int.parse(index['price']);
    }

    notifyListeners();
  }

  void decreaseCount(index) {
    count = index['count'];
    if (count > 0) {
      count--;
    }
    sum = count * int.parse(index['price']);
    notifyListeners();
  }

  void priceSum(sum) {
    sumAll = sum;
    notifyListeners();
  }
}
