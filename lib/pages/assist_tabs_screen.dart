import 'package:da_assist/helper/assist_app_bar.dart';
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
  ];

  void _selectScreen(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: assistAppBar,
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.orange,
        currentIndex: _currentIndex,
        onTap: _selectScreen,
        backgroundColor: Colors.deepPurple,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Products',
          ),
        ],
      ),
    );
  }
}
