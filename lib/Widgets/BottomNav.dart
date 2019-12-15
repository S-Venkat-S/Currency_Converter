import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:currency_converter/Bloc/NavBloc.dart';
import 'package:provider/provider.dart';

class MyBottomNavBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final NavBloc navigation = Provider.of<NavBloc>(context);

    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sync),
            title: Text('Convert'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
        currentIndex: navigation.pageIndex,
        onTap: navigation.setPageIndex,
    );
  }
}