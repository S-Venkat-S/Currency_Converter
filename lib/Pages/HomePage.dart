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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.white70,
        elevation: 10,
        child: TopBar(),
      ),
      Expanded(
        child: CurrencyList()
      )
    ]);
  }
}
