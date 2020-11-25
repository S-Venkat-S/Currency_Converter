import 'package:currency_converter/Utils.dart';
import 'package:flutter/material.dart';

class DataBloc with ChangeNotifier {
  String _baseCurrency = "USD";
  String _fromCurrency = "USD";
  DateTime _currentDateDT = DateTime.now();
  bool _isLoading = true;
  String _currentDateFormat = "DD-MM-YYYY";
  String _currentDate = Utils.formatDate(DateTime.now(), "DD-MM-YYYY");
  List<String> _toCurrencies = new List<String>();

  String get currentDateFormat {
    return _currentDateFormat;
  }

  List<String> get toCurrencies {
    return _toCurrencies;
  }

  String get fromCurrency {
    return _fromCurrency;
  }

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

  void updateToCurrencies(String shortCode, bool value) {
    print(_toCurrencies);
    if (value == false && _toCurrencies.indexOf(shortCode) > -1) {
      _toCurrencies.remove(shortCode);
    }
    else if (value == true) {
      _toCurrencies.add(shortCode);
    }
    notifyListeners();
  }

  set baseCurrency(String value) {
    _baseCurrency = value;
    notifyListeners();
  }

  set fromCurrency(String value) {
    _fromCurrency = value;
    notifyListeners();
  }

  set currentDate(DateTime date) {
    _currentDateDT = date;
    _currentDate = Utils.formatDate(_currentDateDT, _currentDateFormat);
    notifyListeners();
  }

  set currentDateFormat(String dateFormat) {
    _currentDateFormat = dateFormat;
    _currentDate = Utils.formatDate(_currentDateDT, _currentDateFormat);
    notifyListeners();
  }

  set isLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

}