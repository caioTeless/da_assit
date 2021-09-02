import 'package:da_assist/controller/item_controller.dart';
import 'package:da_assist/controller/list_items_controller.dart';
import 'package:da_assist/data/db_helper.dart';
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
              // print('${checkItems(_controller.itemDates[index].date!)}');
              createDialog(context, index);
            },
          );
        });
  }

  Widget alertDialogContainer(int index) {
    final list = checkItems(_controller.itemDates[index].date!);
    return SingleChildScrollView(
      child: Container(
        height: 300.0,
        width: 300.0,
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (ctx, index) {
            return InkWell(
              child: Card(
                elevation: 3,
                child: ExpansionTile(
                  title: Text(list[index]),
                  children: [
                    Card(
                      elevation: 2,
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(list[index]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // child: ListTile(
                //   title: Text(list[index]),
                // ),
              ),
              onTap: () {},
            );
          },
        ),
      ),
    );
  }

  createDialog(BuildContext context, int index) {
    return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text('Teste2'),
          content: alertDialogContainer(index),
        );
      },
    );
  }

  List<String> checkItems(String date) {
    var teste = _controller2.items
        .where((item) => item.date.contains(date))
        .map((e) => e.name)
        .toList();
    return teste;
  }
}
