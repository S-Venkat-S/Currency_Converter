import 'package:flutter/material.dart';

class NavBloc with ChangeNotifier {
  int _pageIndex = 1;

  get pageIndex{
    return _pageIndex;
  }

  void setPageIndex(int value) {
    _pageIndex = value;
    print(value);
    notifyListeners();
  }

}