// import 'package:da_assist/model/item_model.dart';

class ListItemsModel {
  List<DateTime>? date;
  // List<ItemModel> listItemModel;

  // int get length => listItemModel.length > 0 ? listItemModel.length : 0;

  // ListItemsModel({
  //   required this.date,
  //   // required this.listItemModel,
  // });

  int get length => date!.length > 0 ? date!.length : 0;


  addDate(String dateForm){
    date!.add(DateTime.parse(dateForm));
  }

  List<DateTime> returnAllDates(){
    return date!;
  }



  // Map<String, dynamic> generateListItems(){
  //   final listItems = {
  //     'date': date,
  //     'items': listItemModel,
  //   };
  //   return listItems;
  // }

}
