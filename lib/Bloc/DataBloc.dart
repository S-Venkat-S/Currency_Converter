import 'package:currency_converter/Utils.dart';
import 'package:flutter/material.dart';

class DataBloc with ChangeNotifier {
  String _baseCurrency = "USD";
  DateTime _currentDateDT = DateTime.now();
  String _currentDate = Utils.formatDate(DateTime.now());
  bool _isLoading = true;


  String get currentDateString {
    return _currentDate;
  }

  DateTime get currentDate {
    return _currentDateDT;
  }

  String get baseCurrency{
    return _baseCurrency;
  }


  bool get isLoading {
    return _isLoading;
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

  set isLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

}