import 'package:flutter/material.dart';

class LiveData<T> with ChangeNotifier {
  T _data;
  LiveData(this._data);

  T get value => _data;

  set value(T data) {
    _data = data;
    notifyListeners();
  }
}
