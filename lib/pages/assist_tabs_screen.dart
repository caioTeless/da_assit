import 'package:da_assist/pages/assist_calculate.dart';
import 'package:da_assist/pages/assist_home_products.dart';
import 'package:flutter/material.dart';

import 'assist_home.dart';

class AssistTabsScreen extends StatefulWidget {
  const AssistTabsScreen({Key? key}) : super(key: key);

  @override
  _AssistTabsScreenState createState() => _AssistTabsScreenState();
}

class _AssistTabsScreenState extends State<AssistTabsScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    AssistHome(),
    AssistHomeProducts(),
    AssistCalculate(),
  ];

  void _selectScreen(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: _selectScreen,
        backgroundColor: Colors.orange,
        selectedFontSize: 15,
        selectedLabelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Produtos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Cálculos',
          ),
        ],
      ),
    );
  }
}
