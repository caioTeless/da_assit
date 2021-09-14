import 'package:da_assist/controller/list_items_controller.dart';
import 'package:da_assist/helper/const.dart';
import 'package:da_assist/model/item_model.dart';
import 'package:flutter/material.dart';

class ShowDialogItems extends StatefulWidget {
  final int index;
  final ListItemsController controller;
  final Function onUpdate;
  final List<Map<String, dynamic>> checkItems;

  ShowDialogItems({
    required this.index,
    required this.controller,
    required this.onUpdate,
    required this.checkItems,
  });

  @override
  _ShowDialogItemsState createState() => _ShowDialogItemsState();
}

class _ShowDialogItemsState extends State<ShowDialogItems> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        daShowDialogTitle,
        style: TextStyle(fontSize: 25),
      ),
      content: StatefulBuilder(builder: (context, setState) {
        return alertDialogContainer(widget.index, setState);
      }),
    );
  }

  Widget alertDialogContainer(int index, StateSetter _setState) {
    var listItems = widget.checkItems;
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        width: 300.0,
        child: ListView.separated(
          itemCount: listItems.length,
          separatorBuilder: (ctx, index) => const Divider(),
          itemBuilder: (ctx, index) {
            return InkWell(
              child: ExpansionTile(
                title: Text(
                  listItems[index]['name'],
                  style: TextStyle(fontSize: 22),
                ),
                textColor: Colors.black,
                backgroundColor: Colors.grey.shade50,
                children: [
                  Card(
                    elevation: 2,
                    child: ListTile(
                      title: Text(
                        'Itens: ${listItems[index]['amount'].toString()}',
                        style: TextStyle(fontSize: 19, color: Colors.black),
                      ),
                      subtitle: Text(
                        'Valor: R\$ ${listItems[index]['value'].toString()}',
                        style: TextStyle(fontSize: 19, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              onTap: () {
                widget.onUpdate(
                  getItemModel(listItems[index]),
                );
              },
            );
          },
        ),
      ),
    );
  }

  ItemModel getItemModel(Map<String, dynamic> items) {
    return ItemModel(
      id: items['id'],
      date: items['date'],
      name: items['name'],
      amount: items['amount'],
      value: items['value'],
    );
  }
}
