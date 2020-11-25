import 'dart:convert';

import 'package:currency_converter/Constants/UiConstants.dart';
import 'package:currency_converter/DataManager/CurrencyData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:currency_converter/Bloc/DataBloc.dart';

class CurrencyList extends StatelessWidget {

  void _showToast(BuildContext context, String msgStr) {

  }


  Future prepareList(DataBloc data) async {
    print(data.baseCurrency);
    var ratesData = CurrencyData.getData(data.currentDate, data.baseCurrency);
    return ratesData.then((result) {
      result = jsonDecode(result.body)["rates"];
      List<List> currencyData = new List();
      int i = 0;
      for (String currShortCode in result.keys) {
        List symbolData = CurrencyData.getCurrencySymbolData(currShortCode);
        String symbol = symbolData[0];
        String countryName = symbolData[1];
        var price = result[currShortCode];
        currencyData.add([currShortCode, price, symbol, countryName]);
        i++;
      }
      return currencyData;
    });
  }

  //Formating the price to have 3 digits after the decimal (.)
  String formatPrice(var price) {
    String priceStr = price.toString()+"0000";
    if (priceStr.indexOf(".") == -1) {
      return priceStr + ".00";
    } else {
      return priceStr.substring(0, priceStr.indexOf(".") + 3);
    }
  }

  Widget uiBuilder(DataBloc data) {
    return FutureBuilder (
      future: prepareList(data),
      builder: (context, snapshot) {
        String base = data.baseCurrency;
        String date = data.currentDateString;
        if (snapshot.hasData) {
          List<Widget> allRates = new List();
          List<List> allData = snapshot.data.cast<List>();
          for (List arr in allData) {
            String currShortCode = arr[0];
            var price  = arr[1];
            String symbol = arr[2];
            String countryName = arr[3];
            allRates.add(getList(currShortCode, price, symbol, countryName));
          }
          _showToast(context, "Showing $date's data for $base.");
          return ListView(shrinkWrap: true, children:allRates);
        }
        else {
          return Center(
            child: Container(
              margin: const EdgeInsets.all(10.0),
              width: 48.0,
              height: 48.0,
              child: CircularProgressIndicator()
            ),
          );
        }
      }
    );
  }

  Widget getList(String currShortCode, var price, String symbol, String countryName) {
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
    final DataBloc appData = Provider.of<DataBloc>(context);
    return uiBuilder(appData);
  }
}
