import 'package:flutter/material.dart';
import 'package:currency_converter/Constants/UiConstants.dart';

class ChangeDateFormat extends StatelessWidget {
  Widget build (BuildContext build) {
    return GestureDetector(
      onTap: (){print("S");},
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
                  Text("DD-MM-YYYY", style: TextStyle(fontSize: 16, color: Colors.blue),),
                  Icon(Icons.arrow_right, size: 20, color: Colors.blue,)
                ],
              )
            ],
          )
      ),
    );
  }
}