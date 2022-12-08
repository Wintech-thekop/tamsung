import 'package:flutter/cupertino.dart';

class Store with ChangeNotifier {
  String connect = 'connected';
  int count = 0;

  void increaseCount() {
    count++;
    notifyListeners();
  }

  void decreaseCount() {
    count--;
    if (count <= 0) {
      count = 0;
    }
    notifyListeners();
  }
}
