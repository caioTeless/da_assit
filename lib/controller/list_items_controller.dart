import 'package:da_assist/data/db_helper.dart';
import 'package:da_assist/model/list_items_model.dart';

class ListItemsController {

  final DbHelper _dbHelper;

  ListItemsController(this._dbHelper);

  List<ListItemsModel> itemDates = [];
  // List sums = [];

  int get length => itemDates.length > 0 ? itemDates.length : 0;
  // int get lengthSums => sums.length > 0 ? sums.length : 0;

  bool loading = false;

  Future getItemGroup() async {
    loading = true;
    itemDates = await _dbHelper.getItemGroup();
    loading = false;
  } 

  double getTotalSum(){
    double sum = 0.0;
    itemDates.forEach((element) => sum += element.value!);
    return sum;
  }

  int getTotalAmount(){
    int sum = 0;
    itemDates.forEach((element) => sum += element.amount!);
    return sum;
  }



  // Future getSumValue() async{
  //   loading = true;
  //   sums = await _dbHelper.getSumValue();
  //   print('sums - $sums');
  //   loading = false;
  // }

  // double totalSum(){
  //   double sum = 0.0;
  //   sums.forEach((element) => sum += element);
  //   return sum;
  // }
}
