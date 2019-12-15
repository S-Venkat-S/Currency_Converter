import 'package:currency_converter/Utils.dart';
import 'package:flutter/material.dart';

class DataBloc with ChangeNotifier {
  String _baseCurrency = "USD";
  DateTime _currentDateDT = DateTime.now();
  String _currentDate = Utils.formatDate(DateTime.now());


  String get currentDateString {
    return _currentDate;
}

  String get baseCurrency{
    return _baseCurrency;
  }

  set baseCurrency(String value) {
    _baseCurrency = value;
    notifyListeners();
  }

  set currentDate(DateTime date) {
    _currentDateDT = date;
    _currentDate = Utils.formatDate(_currentDateDT);
    notifyListeners();
  }

}