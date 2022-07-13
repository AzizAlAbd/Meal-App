import 'dart:ui';
import 'package:Meals/Models/meal.dart';
import 'package:Meals/screens/filters_screen.dart';
import 'package:Meals/screens/tabs_screen.dart';

import './screens/meal_detail._screen.dart';
import './dummy_data.dart';
import 'screens/Category_meals_screen.dart';
import 'package:flutter/material.dart';
import 'screens/Categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten-free': false,
    'lactus-free': false,
    'vegan': false,
    'vegetraian': false
  };

  List<Meal> _avaliableMeals = DUMMY_MEALS;

  List<Meal> _favoritesMeals = [];

  void _toggleFavorites(String id) {
    final index = _favoritesMeals.indexWhere((element) => element.id == id);
    if (index >= 0) {
      setState(() {
        _favoritesMeals.removeAt(index);
      });
    } else {
      setState(() {
        _favoritesMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == id));
      });
    }
  }

  bool _isfavoriteMeal(String id) {
    return _favoritesMeals.any((element) => element.id == id);
  }

  void _setfilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _avaliableMeals = DUMMY_MEALS.where((element) {
        if (_filters['gluten-free'] && !element.isGlutenFree) {
          return false;
        }
        if (_filters['lactus-free'] && !element.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !element.isVegan) {
          return false;
        }
        if (_filters['vegetraian'] && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meals_App',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 20,
                  fontWeight: FontWeight.bold))),
      //home: Categories(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(_favoritesMeals),
        CategoryMealScreen.routeName: (ctx) =>
            CategoryMealScreen(_avaliableMeals),
        MealDetailScreen.routename: (ctx) =>
            MealDetailScreen(_toggleFavorites, _isfavoriteMeal),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_setfilters, _filters),
      },
    );
  }
}
