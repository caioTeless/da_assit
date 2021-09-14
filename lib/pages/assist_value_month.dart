import 'package:da_assist/controller/list_items_controller.dart';
import 'package:da_assist/data/db_helper.dart';
import 'package:da_assist/helper/assist_app_bar.dart';
import 'package:flutter/material.dart';

class AssistValueMonth extends StatefulWidget {
  @override
  _AssistValueMonthState createState() => _AssistValueMonthState();
}

class _AssistValueMonthState extends State<AssistValueMonth> {
  final ListItemsController _controller = ListItemsController(DbHelper());

  @override
  void initState() {
    _initialize();
    super.initState();
  }

  Future _initialize() async {
    await _controller.getItemGroup();
    // await _controller.getSumValue();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: assistAppBar,
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(''),
                Text('${_controller.getTotalAmount().toString()}'),
                Text('${_controller.getTotalSum().toStringAsFixed(2)}'),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Generate PDF "to do"'),
          ),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _controller.length,
              itemBuilder: (ctx, index) {
                return Container(
                  color: Colors.yellow.shade50,
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(20),
                  height: 80,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_controller.itemDates[index].date!),
                          // Text(_controller.sums[index].toString()),
                          Text(_controller.itemDates[index].amount.toString()),
                          Text(_controller.itemDates[index].value!
                              .toStringAsFixed(2)),
                        ],
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
