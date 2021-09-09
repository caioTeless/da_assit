import 'package:da_assist/controller/item_controller.dart';
import 'package:da_assist/data/db_helper.dart';
import 'package:da_assist/helper/assist_app_bar.dart';
import 'package:da_assist/model/item_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AssistRegisterItem extends StatefulWidget {
  final ItemModel? item;

  AssistRegisterItem({
    Key? key,
    this.item,
  });

  @override
  _AssistRegisterItemState createState() => _AssistRegisterItemState();
}

class _AssistRegisterItemState extends State<AssistRegisterItem> {
  final _formKey = GlobalKey<FormState>();
  final _controller = ItemController(DbHelper());
  final _dateController = TextEditingController();
  int count = 0;

  @override
  void initState() {
    _controller.setId(widget.item?.id);
    if (widget.item?.date != null) {
      _dateController.text = widget.item!.date;
    }
    super.initState();
  }

  Future _selectDate(BuildContext context) async {
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    ).then((date) {
      if (date != null) {
        setState(() {
          _dateController.text = DateFormat('dd/MM/yyyy').format(date);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: assistAppBar,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Text('Type a date for the list'),
                SizedBox(height: 50),
                TextFormField(
                  controller: _dateController,
                  decoration: InputDecoration(
                    hintText: 'DD/MM/YYYY',
                    prefixIcon: Icon(Icons.date_range_outlined),
                    suffixIcon: Icon(Icons.keyboard_arrow_down_outlined),
                  ),
                  readOnly: true,
                  onTap: () => _selectDate(context),
                  onSaved: (value) => _controller.date = value,
                ),
                _dateController.text == ''
                    ? Text('Insert date')
                    : Column(
                        children: [
                          SizedBox(height: 50),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Type name',
                              prefixIcon: Icon(Icons.sticky_note_2_outlined),
                            ),
                            initialValue: widget.item?.name,
                            onSaved: (value) => _controller.name = value,
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            // CRIAR TEXT FORM MANUALMENTE
                            // decoration: InputDecoration(
                            //   hintText: widget.item!.amount > 0 ? widget.item!.amount.toString() : 0.toString(),
                            //   prefixIcon: InkWell(
                            //     onTap: () {
                            //       count = widget.item!.amount;
                            //       if (count > 0) {
                            //         count -= 1;
                            //         print(count);
                            //       }
                            //       widget.item!.amount = count;
                            //     },
                            //     child: Icon(Icons.remove),
                            //   ),
                            //   suffixIcon: InkWell(
                            //     onTap: () {
                            //       count = widget.item!.amount;
                            //       if (count >= 0) {
                            //         count += 1;
                            //       }
                            //       print(count);
                            //       widget.item!.amount = count;
                            //     },
                            //     child: Icon(Icons.add),
                            //   ),
                            // ),
                            // textAlign: TextAlign.center,
                            // readOnly: true,
                            // initialValue: widget.item?.amount.toString(),
                            // onSaved: (_) {
                            //   _controller.amount = count;
                            // },
                            decoration: InputDecoration(
                              hintText: 'Amount',
                            ),
                            initialValue: widget.item?.amount.toString(),
                            onSaved: (value) =>
                                _controller.amount = int.parse(value!),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Type value',
                              prefixIcon: Icon(Icons.attach_money_outlined),
                            ),
                            initialValue: widget.item?.value.toString(),
                            onSaved: (value) =>
                                _controller.value = _checkNull(value),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () => alertDialog(context),
                            // onPressed: () => _onSave(context),
                            child: Text('Insert'),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  double? _checkNull(String? value) {
    if (value == null) {
      return 0.0;
    }
    return double.tryParse(value);
  }

  Future _onSave(BuildContext context) async {
    _formKey.currentState!.save();
    await _controller.save();
    print('Saved');
    print('${_controller.date}');
    Navigator.pop(context);
    // Navigator.of(context, rootNavigator: true).pop();
  }

  alertDialog(BuildContext context) {
    if (_controller.id == null) {
      return showDialog(
        context: context,
        builder: (_) => AlertDialog(
          content: Text('Insert another product ? '),
          actions: [
            TextButton(
              onPressed: () async {
                _onSave(context);
                setState(() {
                  _formKey.currentState!.reset();
                });
              },
              child: Text('Yes'),
            ),
            TextButton(
              child: Text('No'),
              onPressed: () {
                _onSave(context);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    } else {
      _onSave(context);
    }
  }
}
