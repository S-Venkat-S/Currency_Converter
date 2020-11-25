import 'package:currency_converter/Bloc/NavBloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:currency_converter/Pages/HomePage.dart';
import 'package:currency_converter/Pages/ConvertPage.dart';
import 'package:currency_converter/Pages/SettingsPage.dart';


class PageHandler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NavBloc navigation = Provider.of<NavBloc>(context);

//    int pageIndex = 0;
    int pageIndex = navigation.pageIndex;
    StatelessWidget currentPage = HomePage();

    if (pageIndex == 1) {
      currentPage = ConvertPage();
    } else if (pageIndex == 2) {
      currentPage = SettingsPage();
    } else {
      currentPage = HomePage();
    }

    return Container(
      child: currentPage,
    );
  }
}