import 'package:Meals/screens/Favorites_screen.dart';
import 'package:Meals/widgets/mian_drawer.dart';
import '../Models/meal.dart';
import './Categories_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoritesMeals;
  TabsScreen(this.favoritesMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedpageindex = 0;

  @override
  void initState() {
    _pages = [
      {'page': Categories(), 'title': 'Categories'},
      {
        'page': FavoritesScreen(widget.favoritesMeals),
        'title': 'Your Favorites'
      }
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedpageindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //***if we want to show the tab at the bottom of our screen ***
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedpageindex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedpageindex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Colors.white,
          currentIndex: _selectedpageindex,
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          //type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(
                  Icons.category,
                ),
                title: Text(
                  'Categories',
                )),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(
                  Icons.star,
                ),
                title: Text(
                  'Favorites',
                ))
          ]),
    );

    //***if we want to the show the bar under the appbar***
    /*return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Meals"),
            bottom: TabBar(tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favorites',
              )
            ]),
          ),
          body: TabBarView(children: [Categories(), FavoritesScreen()]),
        ));*/
  }
}
