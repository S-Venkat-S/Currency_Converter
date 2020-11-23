import 'package:flutter/material.dart';

class LoadingScreen {

  Future<void> show(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // Cannot click out side of the alert box :)
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select your currency'),
          content: Text("Loading"),
          actions: [],
        );
      },
    );
  }

}