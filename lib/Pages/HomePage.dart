import 'package:flutter/material.dart';
import 'package:currency_converter/Pages/HomePageWidgets/TopBar.dart';
import 'package:currency_converter/Pages/HomePageWidgets/CurrencyList.dart';

class HomePage extends StatelessWidget {
  String date = "29-11-2019";
  String baseCurrency = "USD";

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Card(
        child: TopBar(),
        margin: EdgeInsets.all(0),
        elevation: 10,
      ) ,
      Expanded(
        child: CurrencyList()
      )
    ]);
  }
}
