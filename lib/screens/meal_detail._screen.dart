import 'package:Meals/Models/meal.dart';
import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../Models/meal.dart';

class MealDetailScreen extends StatefulWidget {
  static const routename = '/meal_detail';
  final Function toggleFavorites;
  final Function isfavorites;
  MealDetailScreen(this.toggleFavorites, this.isfavorites);

  @override
  _MealDetailScreenState createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  Widget bulidSectionTile(BuildContext context, String text) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          text,
          style: Theme.of(context).textTheme.title,
        ));
  }

  Widget buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(15)),
        width: 300,
        height: 150,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealid = ModalRoute.of(context).settings.arguments;
    final Meal selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealid);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '${selectedMeal.title}',
            style: Theme.of(context).textTheme.title,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              bulidSectionTile(context, 'Ingredients'),
              buildContainer(
                ListView.builder(
                    itemBuilder: (ctx, index) {
                      return Card(
                        color: Theme.of(context).accentColor,
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Text(selectedMeal.ingredients[index])),
                      );
                    },
                    itemCount: selectedMeal.ingredients.length),
              ),
              bulidSectionTile(context, 'Steps'),
              buildContainer(ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${index + 1}'),
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      Divider(
                        thickness: 5,
                      )
                    ],
                  );
                },
                itemCount: selectedMeal.steps.length,
              ))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: widget.isfavorites(mealid)
                ? Icon(Icons.star)
                : Icon(Icons.star_border),
            onPressed: () {
              widget.toggleFavorites(mealid);
            }));
  }
}
