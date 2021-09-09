import 'package:da_assist/controller/list_items_controller.dart';
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
      title: Text('Items'),
      content: StatefulBuilder(builder: (context, setState) {
        return alertDialogContainer(widget.index, setState);
      }),
    );
  }

  Widget alertDialogContainer(int index, StateSetter _setState) {
    var listItems = widget.checkItems;
    return SingleChildScrollView(
      child: Container(
        height: 300.0,
        width: 300.0,
        child: ListView.builder(
          itemCount: listItems.length,
          itemBuilder: (ctx, index) {
            return InkWell(
              child: Card(
                elevation: 3,
                child: ExpansionTile(
                  title: Text(listItems[index]['name']),
                  children: [
                    Card(
                      color: Colors.blue.shade50,
                      elevation: 2,
                      child: ListTile(
                        title: Text(listItems[index]['amount'].toString()),
                        subtitle:
                            Text('R\$ ${listItems[index]['value'].toString()}'),
                      ),
                    ),
                  ],
                ),
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

// createDialog(BuildContext context, int index) {
//   return showDialog(
//     context: context,
//     builder: (_) {
//         return AlertDialog(
//           title: Text('Teste2'),
//           content: alertDialogContainer(index),
//         );
//     },
//   );
// }

// Widget alertDialogContainer(int index) {
//   final list = widget.checkItems(widget.controller.itemDates[index].date!);
//   return SingleChildScrollView(
//     child: Container(
//       height: 300.0,
//       width: 300.0,
//       child: ListView.builder(
//         itemCount: list.length,
//         itemBuilder: (ctx, index) {
//           return InkWell(
//             child: Card(
//               elevation: 3,
//               child: ExpansionTile(
//                 title: Text(list[index]['name']),
//                 children: [
//                   Card(
//                     elevation: 2,
//                     child: Column(
//                       children: [
//                         ListTile(
//                           title: Text(list[index]['amount'].toString()),
//                           subtitle:
//                               Text('R\$ ${list[index]['value'].toString()}'),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             onTap: () => _onUpdate(getItemModel(list[index])),
//           );
//         },
//       ),
//     ),
//   );
// }
