import 'package:currency_converter/Constants/UiConstants.dart';
import 'package:currency_converter/DataManager/CurrencyData.dart';
import 'package:flutter/material.dart';

class CurrencyList extends StatelessWidget {
  CurrencyData data = new CurrencyData();

  List<Widget> prepareList() {
    var ratesData = data.getData("");
    List<Widget> list = new List(ratesData.keys.length);
    int i = 0;
    for (String currShortCode in ratesData.keys) {
      List symbolData = data.getCurrencySymbolData(currShortCode);
      String symbol = symbolData[0];
      String countryName = symbolData[1];
      var price = ratesData[currShortCode];
      list[i] = uiBuilder(currShortCode, price, symbol, countryName);
      i++;
    }
    return list;
  }

  //Formating the price to have 3 digits after the decimal (.)
  String formatPrice(var price) {
    String priceStr = price.toString();
    if (priceStr.indexOf(".") == -1) {
      return priceStr + ".00";
    } else {
      return priceStr.substring(0, priceStr.indexOf(".") + 4);
    }
  }

  Widget uiBuilder(
      String currShortCode, var price, String symbol, String countryName) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
              child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(countryName,
                      style: TextStyle(fontSize: UiConstants.fontSizeNormal)))),
          Text(currShortCode,
              style: TextStyle(fontSize: UiConstants.fontSizeNormal)),
          Expanded(
              child: Text(symbol + " " + formatPrice(price),
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: UiConstants.fontSizeNormal))),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: prepareList());
  }
}
