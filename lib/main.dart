import 'package:da_assist/pages/assist_calculate.dart';
import 'package:da_assist/pages/assist_home_products.dart';
import 'package:da_assist/pages/assist_register_item.dart';
import 'package:da_assist/pages/assist_tabs_screen.dart';
import 'package:da_assist/pages/assist_value_month.dart';
import 'package:da_assist/routes/assist_routes.dart';
import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: Colors.purpleAccent,
        primaryColor: Colors.purple,
      ),
      routes: {
        AssistRoutes.ASSIST_HOME: (ctx) => AssistTabsScreen(),
        AssistRoutes.ASSIST_HOME_PRODUCTS: (ctx) => AssistHomeProducts(),
        AssistRoutes.ASSIST_REGISTER_ITEM: (ctx) => AssistRegisterItem(),
        AssistRoutes.ASSIST_CALCULATE: (ctx) => AssistCalculate(),
        AssistRoutes.ASSIST_VALUE_MONTH: (ctx) => AssistValueMonth(),
      }
    );
  }
}
