import 'package:flutter/material.dart';
import 'package:currency_converter/Constants/UiConstants.dart';
import 'package:provider/provider.dart';
import 'package:currency_converter/Bloc/DataBloc.dart';
import 'package:currency_converter/DataManager/CurrencyData.dart';
import 'package:currency_converter/Pages/HomePageWidgets/CurrencyList.dart';

class ConvertForm extends StatefulWidget {
  ConvertForm({Key key}) : super(key: key);
  @override
  _ConvertFormState createState() => _ConvertFormState();
}

class _ConvertFormState extends State<ConvertForm> {

  double amount;
  List<String> toList = ["INR", "USD"];
  bool isAmountError = false;
  List<Widget> selectFromCurrency(BuildContext context) {
    Iterable currencies = CurrencyData.getAvailableCurrency();
    List<Widget> currencyLists = new List<Widget>(currencies.length);
    int count = 0;
    for (String currency in currencies) {
      List<String> currencyData = CurrencyData.getCurrencySymbolData(currency);
      Widget radio = getRadioWidget(currency, currencyData[1], currencyData[0], context);
      currencyLists[count] = radio;
      count++;
    }
    return currencyLists;
  }

  Widget getRadioWidget(String shortCode, String name, String symbol, BuildContext context) {
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.start,
    //   children: [
    //     Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children:[Text(name), Text(symbol)]
    //     ),
    //     Column(
    //       crossAxisAlignment: CrossAxisAlignment.end,
    //       children: [
    //         Radio(
    //           value: shortCode,
    //           groupValue: _fromCurrency,
    //           onChanged: (value) {setState(() {
    //             _fromCurrency = value;
    //           });})],
    //     )
    //   ],
    // );
    final DataBloc appData = Provider.of<DataBloc>(context);
    return RadioListTile(
        title: Text(name),
        subtitle: Text(symbol),
        value: shortCode,
        groupValue: appData.fromCurrency,
        activeColor: Colors.blue,
        onChanged: (value) {appData.fromCurrency = value;}
    );
  }

  Future<void> fromCurrencySelectWidget(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // Cannot click out side of the alert box :)
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select from currency'),
          content: SingleChildScrollView(
            child: ListBody(
              children: selectFromCurrency(context),
            )
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

  void updateAmount(String val) {
    try {
      double value = double.parse(val);
      setState(() {
        amount = value;
        isAmountError = false;
      });
    }
    catch (e) {
      setState(() {
        isAmountError = true;
      });
    }
  }

  List<Widget> updateChips(BuildContext context) {
    final DataBloc appData = Provider.of<DataBloc>(context);
    List<Widget> chips = new List<Widget>();
    for (String to in appData.toCurrencies) {
      chips.add(
        Chip(
          label: Text(to),
          padding: EdgeInsets.all(5),
          deleteIcon: Icon(
            Icons.cancel
          ),
          onDeleted: (){appData.updateToCurrencies(to, false);},
        )
      );
    }
    return chips;
  }

  List<Widget> selectToCurrency(BuildContext context) {
    Iterable currencies = CurrencyData.getAvailableCurrency();
    List<Widget> currencyLists = new List<Widget>(currencies.length);
    int count = 0;
    for (String currency in currencies) {
      List<String> currencyData = CurrencyData.getCurrencySymbolData(currency);
      Widget radio = getCheckBoxWidget(currency, currencyData[1], currencyData[0], context);
      currencyLists[count] = radio;
      count++;
    }
    return currencyLists;
  }

  Widget getCheckBoxWidget(String shortCode, String name, String symbol, BuildContext context) {
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.start,
    //   children: [
    //     Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children:[Text(name), Text(symbol)]
    //     ),
    //     Column(
    //       crossAxisAlignment: CrossAxisAlignment.end,
    //       children: [
    //         Radio(
    //           value: shortCode,
    //           groupValue: _fromCurrency,
    //           onChanged: (value) {setState(() {
    //             _fromCurrency = value;
    //           });})],
    //     )
    //   ],
    // );
    final DataBloc appData = Provider.of<DataBloc>(context);
    bool isSelected = false;
    for (String toCurrency in appData.toCurrencies) {
      if (toCurrency == shortCode) {
        isSelected = true;
        break;
      }
    }
    return CheckboxListTile (
        title: Text(name),
        subtitle: Text(symbol),
        value: isSelected,
        activeColor: Colors.blue,
        onChanged: (value) {appData.updateToCurrencies(shortCode, value);}
    );
  }

  Future<void> toCurrencySelectWidget(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // Cannot click out side of the alert box :)
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select from currency'),
          content: SingleChildScrollView(
              child: ListBody(
                children: selectToCurrency(context),
              )
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

  @override
  Widget build(BuildContext context) {
    final DataBloc appData = Provider.of<DataBloc>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
        onTap: (){fromCurrencySelectWidget(context);},
        behavior: HitTestBehavior.opaque,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("From currency", style: TextStyle(fontSize: UiConstants.fontSizeNormal),),
                Wrap(
                  spacing: 2,
                  children: <Widget>[
                    Text(appData.fromCurrency, style: TextStyle(fontSize: 16, color: Colors.blue),),
                    Icon(Icons.arrow_right, size: 20, color: Colors.blue,)
                  ],
                )
              ],
            )
        ),
      ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: TextField(
            decoration: new InputDecoration(
                labelText: "Enter amount",
                errorText: isAmountError ? 'Please correct value' : null,
            ),
            keyboardType: TextInputType.number, // Only numbers can be entered
            onChanged: (value) {updateAmount(value);},

          ),
        ),
        GestureDetector(
          onTap: (){toCurrencySelectWidget(context);},
          behavior: HitTestBehavior.opaque,
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("To currencies", style: TextStyle(fontSize: UiConstants.fontSizeNormal),),
                  Wrap(
                    spacing: 2,
                    children: <Widget>[
                      Icon(Icons.arrow_drop_down, size: 20, color: Colors.blue,)
                    ],
                  )
                ],
              )
          ),
        ),
        Container(
          child: Wrap(
            spacing: 4.0,
            children: updateChips(context),
          ),
          ),
        Container(
          child: Expanded(child: CurrencyList(),),
        )
      ]
      );
    }
}