import 'package:da_assist/model/item_model.dart';

class ListItemsModel {
  String? date;
  int? amount;
  double? value;
  ItemModel? itemModel;

  ListItemsModel({
    this.date,
    this.amount,
    this.value,
    this.itemModel,
  });

  factory ListItemsModel.fromMap(Map<String, dynamic> map) {
    return ListItemsModel(
      date: map['date'],
      amount: map['amount'],
      value: map['value'],
      itemModel: map['itemModel'],
    );
  }
}
