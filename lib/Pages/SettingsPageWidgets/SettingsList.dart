import 'package:currency_converter/Pages/SettingsPageWidgets/ChangeDateFormat.dart';
import 'package:flutter/material.dart';
import 'ChangeBaseCurrency.dart';

class SettingsList extends StatelessWidget {
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      ChangeBaseCurrency(),
      Divider(),
      ChangeDateFormat(),
      Divider(),
    ]);
  }
}
