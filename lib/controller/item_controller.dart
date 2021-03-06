import 'package:da_assist/data/db_helper.dart';
import 'package:da_assist/model/item_model.dart';

class ItemController{

  final DbHelper _dbHelper;

  ItemController(this._dbHelper);

  List<ItemModel> items = [];

  List<ItemModel> newItems = [];

  int get length => items.length > 0 ? items.length : 0;

  int? id;
  String? date;
  String? name;
  int? amount;
  double? value;
  bool loading = false; 

  setId(int? value) => id = value;

  Future save() async{
    final itemModel = ItemModel(
      id: id,
      date: date!,
      name: name!,
      amount: amount!,
      value: value
    );
    if(id == null){
      print('$id no save controller - $name');
      _dbHelper.insert(itemModel);
    }else{
      _dbHelper.update(itemModel);
    }
  }

  Future readAll() async{
    loading = true;
    items = await _dbHelper.readAll();
    loading = false;
  }


  Future delete(ItemModel itemModel) async{
    loading = true;
    await _dbHelper.delete(itemModel);
    loading = false;
  }

  void addNewItems(List<ItemModel> newList){
    newItems = newList;
  }
}