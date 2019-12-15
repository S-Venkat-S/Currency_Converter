import 'package:currency_converter/Bloc/NavBloc.dart';
import 'package:currency_converter/Bloc/DataBloc.dart';
import 'package:flutter/material.dart';
import 'Widgets/BottomNav.dart';
import 'package:provider/provider.dart';
import 'package:currency_converter/PageHandler.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyMaterialApp());

class MyMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = false;
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => NavBloc()),
          ChangeNotifierProvider(create: (_) => DataBloc())
        ],
        child: MaterialApp(
            home: Scaffold(
                appBar: AppBar(
                  title: Text("Currency Converter"),
                ),
                body: PageHandler(),
                bottomNavigationBar: MyBottomNavBar())));
  }
}
