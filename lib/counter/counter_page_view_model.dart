import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class CounterPageViewModel extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }
}
