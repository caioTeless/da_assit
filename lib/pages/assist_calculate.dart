import 'package:flutter/material.dart';

class AssistCalculate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GridView.count(
          padding: EdgeInsets.all(12),
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          shrinkWrap: true,
          children: [
            InkWell(
              child: Container(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text('VALUE PER MONTH'),
              ),
              onTap: (){
                print('value per month');
              },
            ),
            Container(
              decoration: BoxDecoration(color: Colors.orange),
              child: Text('GRAPHICS'),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.purple),
              child: Text('STATISTCS'),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.yellow),
              child: Text('IMPROVE'),
            ),
          ],
        ),
      ),
    );
  }
}
