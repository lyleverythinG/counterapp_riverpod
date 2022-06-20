import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//resets the state when user leaves  a screen
final counterProvider = ChangeNotifierProvider.autoDispose(
  (ref) => CounterChangeNotifier(),
);

class CounterChangeNotifier extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }
}
