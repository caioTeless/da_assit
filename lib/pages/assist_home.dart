import 'package:da_assist/helper/assist_app_bar.dart';
import 'package:da_assist/model/list_items_model.dart';
import 'package:flutter/material.dart';

class AssistHome extends StatefulWidget {
  const AssistHome({Key? key}) : super(key: key);

  @override
  _AssistHomeState createState() => _AssistHomeState();
}

class _AssistHomeState extends State<AssistHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: assistAppBar,
      body: Center(
        child: Text('Teste'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/home-products');
        },
      ),
    );
  }
}
