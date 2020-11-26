import 'package:currency_converter/DataManager/CurrencyData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:currency_converter/Bloc/DataBloc.dart';
import 'package:currency_converter/Utils.dart';

class TopBar extends StatelessWidget {
  CurrencyData curr = new CurrencyData();

  void updateDate(DateTime date) {
    print(date);
  }

  Future<Null> dateSelectWidget(BuildContext context) async {
    final DataBloc appData = Provider.of<DataBloc>(context);
    final DateTime datePicked = await showDatePicker(
        context: context,
        initialDate: appData.currentDate,
        firstDate: appData.currentDate.subtract(new Duration(days: 365)),
        lastDate: DateTime.now());
    if (null != datePicked) {
      appData.currentDate = datePicked;
    }
  }

  Widget build(BuildContext context) {
    final DataBloc appData = Provider.of<DataBloc>(context);
    return ListTile(
      contentPadding: EdgeInsets.all(10),
      tileColor: Colors.white,
      title: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Exchange Rate",
                style: TextStyle(fontSize: 24),
              ),
              GestureDetector(
                  onTap: () {
                    dateSelectWidget(context);
                  },
                  child: Wrap(
                    children: <Widget>[
                      Text(
                        appData.currentDateString + " ",
                        style: TextStyle(fontSize: 24),
                      ),
                      Icon(Icons.arrow_drop_down, color: Colors.blue)
                    ],
                  ))
            ],
          ),
          Expanded(
            child:Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                "For 1 " + CurrencyData.getCurrencySymbolData(appData.baseCurrency)[1],
                style: TextStyle(fontSize: 24),
                overflow: TextOverflow.ellipsis,
                ),

              Text(
                appData.baseCurrency +
                    " ( " +
                    CurrencyData.getCurrencySymbolData(appData.baseCurrency)[0] +
                    " )",
                style: TextStyle(fontSize: 24),
              ),
            ],
          ))
        ],
      )
    );
  }
}
