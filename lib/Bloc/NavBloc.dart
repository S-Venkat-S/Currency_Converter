import 'package:flutter/material.dart';

class NavBloc with ChangeNotifier {
  int _pageIndex = 0;

  get pageIndex{
    return _pageIndex;
  }

  void setPageIndex(int value) {
    _pageIndex = value;
    notifyListeners();
  }

}