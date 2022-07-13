import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/Category_item.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(15),
      children: [
        ...DUMMY_CATEGORIES.map((catdata) {
          return Category_item(
            id: catdata.id,
            title: catdata.title,
            color: catdata.color,
          );
        }).toList()
      ],
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
    );
  }
}
