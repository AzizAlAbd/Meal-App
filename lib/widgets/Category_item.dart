import 'package:flutter/material.dart';
import '../screens/Category_meals_screen.dart';

class Category_item extends StatelessWidget {
  final String title;
  final String id;
  final Color color;
  Category_item({this.id, this.title, this.color});
  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealScreen.routeName,
            arguments: {'id': id, 'title': title})

        /*push(MaterialPageRoute(builder: (_) {
      return CategoryMealScreen(id, title);
    }))*/
        ;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
