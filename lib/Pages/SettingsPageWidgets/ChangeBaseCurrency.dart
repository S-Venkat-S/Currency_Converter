import 'package:currency_converter/Bloc/DataBloc.dart';
import 'package:currency_converter/DataManager/CurrencyData.dart';
import 'package:flutter/material.dart';
import 'package:currency_converter/Constants/UiConstants.dart';
import 'package:provider/provider.dart';

class ChangeBaseCurrency extends StatelessWidget {

  String tempBaseCurrency;

  List<Widget> selectCurrencyWidget(DataBloc appData, BuildContext context) {
    tempBaseCurrency = appData.baseCurrency.toString();
    print(tempBaseCurrency);
    Iterable availableCurrencies = CurrencyData.getAvailableCurrency();
    List<Widget> radioList = new List(availableCurrencies.length);
    int count = 0;
    for (String currency in availableCurrencies) {
      radioList[count] = getRadioWidget(currency, appData, context);
      count++;
    }
    return radioList;
  }

  Widget getRadioWidget(String data, DataBloc appData, BuildContext context) {
    final DataBloc appData = Provider.of<DataBloc>(context);
    return ListTile(
      title: Text(data),
      trailing: Radio(
        value: data,
        groupValue: appData.baseCurrency,
        activeColor: Colors.blue,
        onChanged: (value) {appData.baseCurrency = value;},
      ),
    );
  }

  Future<void> currencySelectWidget(BuildContext context) async {
    final DataBloc appData = Provider.of<DataBloc>(context);
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // Cannot click out side of the alert box :)
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select your currency'),
          content: SingleChildScrollView(
            child: ListBody(
              children: selectCurrencyWidget(appData, context),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget build (BuildContext context) {
    final DataBloc appData = Provider.of<DataBloc>(context);
    return GestureDetector(
      onTap: (){currencySelectWidget(context);},
      behavior: HitTestBehavior.opaque,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Your currency", style: TextStyle(fontSize: UiConstants.fontSizeNormal),),
              Wrap(
                spacing: 2,
                children: <Widget>[
                  Text(appData.baseCurrency, style: TextStyle(fontSize: 16, color: Colors.blue),),
                  Icon(Icons.arrow_right, size: 20, color: Colors.blue,)
                ],
              )
            ],
          )
      ),
    );
  }
}