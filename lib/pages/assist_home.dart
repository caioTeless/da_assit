import 'package:da_assist/controller/item_controller.dart';
import 'package:da_assist/data/db_helper.dart';
import 'package:da_assist/helper/assist_app_bar.dart';
import 'package:da_assist/model/item_model.dart';
import 'package:da_assist/pages/assist_register_item.dart';
import 'package:da_assist/widgets/item_list.dart';
import 'package:flutter/material.dart';

class AssistHome extends StatefulWidget {
  @override
  _AssistHomeState createState() => _AssistHomeState();
}

class _AssistHomeState extends State<AssistHome> {
  final _controller = ItemController(DbHelper());

  @override
  void initState() {
    _initialize();
    super.initState();
  }

  Future _initialize() async {
    await _controller.readAll();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: assistAppBar,
      body: RefreshIndicator(
        onRefresh: _initialize,
        child: ItemList(
          loading: _controller.loading,
          itemCount: _controller.length,
          itemBuilder: _buildItem,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed('/register-item');
          setState(() {});
        },
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    final data = _controller.items[index];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      child: InkWell(
        onTap: () => _onUpdate(data),
        child: Card(
          elevation: 5,
          child: ListTile(
            leading: CircleAvatar(child: Text(data.amount.toString())),
            title: Text(data.name),
            subtitle: Text('R\$ ${data.value}'),
          ),
        ),
      ),
    );
  }

  _onUpdate(ItemModel itemModel) async {
    print('${itemModel.id} onUpdate home');
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AssistRegisterItem(item: itemModel),
      ),
    );
    _initialize();
    print('${itemModel.id} onUpdate home 2');
  }
}
