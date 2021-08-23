import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  final bool loading;

  ItemList({
    required this.itemBuilder,
    required this.itemCount,
    required this.loading,
  });
  
  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}
