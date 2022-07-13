import 'package:Meals/Models/meal.dart';
import '../widgets/meal_item.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favortiesMeals;
  FavoritesScreen(this.favortiesMeals);
  @override
  Widget build(BuildContext context) {
    return favortiesMeals.isEmpty
        ? Center(child: Text('No Meals have been added yet to you favorites'))
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Meal_item(
                favortiesMeals[index].id,
                favortiesMeals[index].title,
                favortiesMeals[index].imageUrl,
                favortiesMeals[index].duration,
                favortiesMeals[index].complexity,
                favortiesMeals[index].affordability,
              );
            },
            itemCount: favortiesMeals.length,
          );
  }
}
