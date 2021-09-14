import 'package:da_assist/controller/item_controller.dart';
import 'package:da_assist/controller/list_items_controller.dart';
import 'package:da_assist/data/db_helper.dart';
import 'package:da_assist/helper/assist_app_bar.dart';
import 'package:da_assist/helper/const.dart';
import 'package:da_assist/model/item_model.dart';
import 'package:da_assist/pages/assist_register_item.dart';
import 'package:da_assist/routes/assist_routes.dart';
import 'package:da_assist/widgets/show_dialog_items.dart';
import 'package:da_assist/widgets/text_button_widget.dart';
import 'package:da_assist/widgets/text_home_widget.dart';
import 'package:flutter/material.dart';

class AssistHome extends StatefulWidget {
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
    return Scaffold(
      appBar: assistAppBar,
      body: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                border: Border.all(width: 0.5),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0)),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.orange.shade700, Colors.orange.shade500]),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextHomeWidget(
                        text: daHomeTitle, size: 18, condition: true),
                    SizedBox(height: 50),
                    TextHomeWidget(
                      text:
                          'R\$ ${_controller.getTotalSum().toStringAsFixed(2)}',
                      size: 34,
                      condition: false,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextHomeWidget(
                      text: 'Itens: ${_controller.getTotalAmount().toString()}',
                      size: 20,
                      condition: true,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButtonWidget(
                      text: daFirstTextButton,
                      size: 15,
                      pushNamed: goToProducts),
                  TextButtonWidget(
                      text: daSecondTextButton,
                      size: 15,
                      pushNamed: goToValueMonth),
                ],
              ),
            ),
            SizedBox(height: 12),
            Flexible(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _controller.length,
                  itemBuilder: (ctx, index) {
                    return InkWell(
                      child: Card(
                        elevation: 2,
                        child: ListTile(
                          title: Text(
                            _controller.itemDates[index].date!,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      onTap: () async {
                        final listItems =
                            checkItems(_controller.itemDates[index].date!);
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
                  }),
            ),
          ],
        ),
      ),
    );
  }

  _onUpdate(ItemModel itemModel) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => AssistRegisterItem(item: itemModel)),
    );
    _initialize();
  }

  List<Map<String, dynamic>> checkItems(String date) {
    var items = _controller2.items
        .where((item) => item.date.contains(date))
        .map((e) => e.toMap())
        .toList();
    return items;
  }

  void goToProducts(BuildContext context) {
    Navigator.of(context).pushNamed(AssistRoutes.ASSIST_HOME_PRODUCTS);
  }

  void goToValueMonth(BuildContext context) {
    Navigator.of(context).pushNamed(AssistRoutes.ASSIST_VALUE_MONTH);
  }
}
