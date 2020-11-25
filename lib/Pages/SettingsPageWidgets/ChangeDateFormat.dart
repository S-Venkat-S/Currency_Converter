import 'package:currency_converter/Bloc/DataBloc.dart';
import 'package:flutter/material.dart';
import 'package:currency_converter/Constants/UiConstants.dart';
import 'package:provider/provider.dart';

class ChangeDateFormat extends StatelessWidget {

  Widget build (BuildContext context) {
    final DataBloc appData = Provider.of<DataBloc>(context);
    return GestureDetector(
      onTap: (){dateSelectWidget(context);},
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Date Format", style: TextStyle(fontSize: UiConstants.fontSizeNormal),),
              Wrap(
                spacing: 2,
                children: <Widget>[
                  Text(appData.currentDateFormat, style: TextStyle(fontSize: 16, color: Colors.blue),),
                  Icon(Icons.arrow_right, size: 20, color: Colors.blue,)
                ],
              )
            ],
          )
      ),
    );
  }

  String nowSelectedFormat;

  final List dateFormats = ["DD-MM-YYYY", "DD-MMM-YYYY", "MMM-DD-YYYY", "DD/MM/YYYY", "DD/MMM/YYYY", "MMM/DD/YYYY",];

  List<Widget> getDateList(DataBloc appData, BuildContext context) {
    List<Widget> allOptions = new List();
    nowSelectedFormat = appData.currentDateFormat;
    for (String dateFormat in dateFormats) {
      Widget radio = getRadio(dateFormat, context);
      allOptions.add(radio);
    }
    return allOptions;
  }

  Widget getRadio(String data, BuildContext context) {
    final DataBloc appData = Provider.of<DataBloc>(context);
    return ListTile(
      title: Text(data),
      trailing: Radio(
        value: data,
        groupValue: appData.currentDateFormat,
        activeColor: Colors.blue,
        onChanged: (value) {appData.currentDateFormat = value;},
      ),
    );
  }

  Future<void> dateSelectWidget(BuildContext context) async {
    final DataBloc appData = Provider.of<DataBloc>(context);
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // Cannot click out side of the alert box :)
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select your date format'),
          content: SingleChildScrollView(
            child: ListBody(
              children: getDateList(appData, context),
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
}