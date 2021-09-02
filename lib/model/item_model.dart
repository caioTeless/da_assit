class ItemModel {
  int? id;
  String date;
  String name;
  int amount;
  double? value = 0.0;

  ItemModel({
    this.id,
    required this.date,
    required this.name,
    required this.amount,
    this.value,
  });

  Map<String, dynamic> toMap() {
    final data = {
      'date': date,
      'name': name,
      'amount': amount,
      'value': value,
    };
    if (id != null) {
      data['id'] = id;
    }
    return data;
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      id: map['id'],
      date: map['date'],
      name: map['name'],
      amount: map['amount'],
      value: map['value'] != null ? map['value'] : 0.0,
    );
  }

  // List<ItemModel> returnItemModel() {

  // }
}
