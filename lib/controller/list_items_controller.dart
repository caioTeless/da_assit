import 'package:da_assist/data/db_helper.dart';
import 'package:da_assist/model/list_items_model.dart';

class ListItemsController {

  final DbHelper _dbHelper;

  ListItemsController(this._dbHelper);

  List<ListItemsModel> itemDates = [];

  int get length => itemDates.length > 0 ? itemDates.length : 0;

  bool? loading;

  Future getItemGroup() async {
    loading = true;
    itemDates = await _dbHelper.getItemGroup();
    loading = false;
  } 
}
