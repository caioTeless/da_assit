import 'package:da_assist/controller/item_controller.dart';
import 'package:da_assist/controller/list_items_controller.dart';
import 'package:da_assist/data/db_helper.dart';
import 'package:da_assist/model/item_model.dart';
import 'package:da_assist/pages/assist_register_item.dart';
import 'package:da_assist/widgets/show_dialog_items.dart';
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
            onTap: () async {
              final listItems = checkItems(_controller.itemDates[index].date!);
              await showDialog(
                context: context,
                builder: (_) => ShowDialogItems(
                  index: index,
                  checkItems: listItems,
                  controller: _controller,
                  onUpdate: _onUpdate,
                ),
              );
            },
          );
        });
  }

  _onUpdate(ItemModel itemModel) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => AssistRegisterItem(item: itemModel)),
    );
    _initialize();
  }

  List<Map<String, dynamic>> checkItems(String date) {
    var teste = _controller2.items
        .where((item) => item.date.contains(date))
        .map((e) => e.toMap())
        .toList();
    return teste;
  }
}
