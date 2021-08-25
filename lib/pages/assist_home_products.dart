import 'package:da_assist/controller/item_controller.dart';
import 'package:da_assist/data/db_helper.dart';
import 'package:da_assist/helper/assist_app_bar.dart';
import 'package:da_assist/model/item_model.dart';
import 'package:da_assist/pages/assist_register_item.dart';
import 'package:da_assist/widgets/item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class AssistHomeProducts extends StatefulWidget {
  @override
  _AssistHomeProductsState createState() => _AssistHomeProductsState();
}

class _AssistHomeProductsState extends State<AssistHomeProducts> {
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
        onPressed: _onCreate,
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    final data = _controller.items[index];
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
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
      ),
      actions: [
        IconSlideAction(
          caption: 'Delete',
          color: Theme.of(context).accentColor,
          icon: Icons.delete,
          onTap: () => _onDelete(data),
        )
      ],
    );
  }

  _onCreate() async {
    await Navigator.of(context).pushNamed('/register-item');
    _initialize();
  }

  _onDelete(ItemModel itemModel) async {
    await _controller.delete(itemModel);
    _initialize();
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
