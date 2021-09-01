import 'package:da_assist/model/item_model.dart';

class ListItemsModel {
  String? date;
  ItemModel? itemModel;

  ListItemsModel({
    this.date,
    this.itemModel,
  });

  factory ListItemsModel.fromMap(Map<String, dynamic> map) {
    return ListItemsModel(
      date: map['date'],
      itemModel: map['itemModel'],
    );
  }
}
