import 'package:Meals/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import '../Models/meal.dart';
import '../dummy_data.dart';

class CategoryMealScreen extends StatefulWidget {
  static const String routeName = '/category-meals';
  final List<Meal> avaliableMeals;
  CategoryMealScreen(this.avaliableMeals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String title;
  List<Meal> displyedMeals;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routarg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    title = routarg['title'];

    final String id = routarg['id'];
    displyedMeals = widget.avaliableMeals.where((meal) {
      return meal.categories.contains(id);
    }).toList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Meal_item(
            displyedMeals[index].id,
            displyedMeals[index].title,
            displyedMeals[index].imageUrl,
            displyedMeals[index].duration,
            displyedMeals[index].complexity,
            displyedMeals[index].affordability,
          );
        },
        itemCount: displyedMeals.length,
      ),
    );
  }
}
