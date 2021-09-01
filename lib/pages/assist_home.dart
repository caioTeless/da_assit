import 'package:da_assist/controller/item_controller.dart';
import 'package:da_assist/controller/list_items_controller.dart';
import 'package:da_assist/data/db_helper.dart';
import 'package:da_assist/model/item_model.dart';
import 'package:flutter/material.dart';

class AssistHome extends StatefulWidget {
  const AssistHome({Key? key}) : super(key: key);

  @override
  _AssistHomeState createState() => _AssistHomeState();
}

class _AssistHomeState extends State<AssistHome> {
  final _controller = ListItemsController(DbHelper());
  final _controller2 = ItemController(DbHelper());

  @override
  void initState() {
    _initialize();
    super.initState();
  }

  Future _initialize() async {
    await _controller.getItemGroup();
    await _controller2.readAll();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _controller.length,
        itemBuilder: (ctx, index) {
          return InkWell(
            child: Card(
              elevation: 4,
              child: ListTile(
                title: Text(_controller.itemDates[index].date!),
              ),
            ),
            onTap: () {
              print(
                '${checkItems(index, _controller.itemDates[index].date!)}'
              );
            },
          );
        });
  }

  List<ItemModel> checkItems(int index, String date){
    final data = _controller2.items[index];
    var teste = _controller2.items.where((item) => item.date.contains(date)).toList();
    return teste;
  }
}
