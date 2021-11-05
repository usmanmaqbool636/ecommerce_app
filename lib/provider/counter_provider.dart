// ignore_for_file: avoid_print

import 'package:ecommerce_app/models/counter_prefrences.dart';
import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  CounterPrefrence counterPrefrence = CounterPrefrence();
  int _count = 0;
  int get count => _count;
  set count(int value) {
    _count = value;
    notifyListeners();
  }

  void increment() {
    _count++;
    counterPrefrence.increment();
    print("[increment] provider $_count");
    notifyListeners();
  }

  void decrement() {
    _count--;
    counterPrefrence.decrement();
    notifyListeners();
  }

  void resetValue() {
    _count = 0;
    counterPrefrence.reset();
    notifyListeners();
  }

  void getValue() async {
    int value = await counterPrefrence.getCounter();
    print("value in counter p $value");
    _count = value;
    notifyListeners();
  }
}
