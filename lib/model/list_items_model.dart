import 'package:da_assist/model/item_model.dart';

class ListItemsModel {
  DateTime date;
  List<ItemModel> listItemModel;

  int get length => listItemModel.length > 0 ? listItemModel.length : 0;

  ListItemsModel({
    required this.date,
    required this.listItemModel,
  });

  Map<String, dynamic> generateListItems(){
    final listItems = {
      'date': date,
      'items': listItemModel,
    };
    return listItems;
  }

}
