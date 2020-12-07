import 'package:flutter/material.dart';
import 'SettingsPageWidgets/SettingsList.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(child: SettingsList(),),
        Expanded(child: Container()),
        Text("The data / rates in this app are served by "),
        Text("exchangeratesapi.io", style: TextStyle(color: Colors.blue),),
        Divider(color: Colors.white,)
      ],
    );
  }
}