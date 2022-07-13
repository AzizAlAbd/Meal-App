import '../widgets/mian_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filterscreen';
  final Function setfillters;
  final Map<String, bool> filters;
  FiltersScreen(this.setfillters, this.filters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetraian = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  @override
  initState() {
    _glutenFree = widget.filters['gluten-free'];
    _vegetraian = widget.filters['vegetraian'];
    _lactoseFree = widget.filters['lactus-free'];
    _vegan = widget.filters['vegan'];
    super.initState();
  }

  Widget _buildSwitchTile(
      String title, bool value, String subtitle, Function updateVlaue) {
    return SwitchListTile(
        title: Text(title),
        value: value,
        subtitle: Text(
          subtitle,
        ),
        onChanged: updateVlaue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten-free': _glutenFree,
                  'lactus-free': _lactoseFree,
                  'vegan': _vegan,
                  'vegetraian': _vegetraian
                };
                widget.setfillters(selectedFilters);
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(20),
            child: Text(
              'adjust your meals selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchTile('Gluten-free', _glutenFree,
                    'Only include Gluteen-free meals', (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buildSwitchTile('Lactus-free', _lactoseFree,
                    'Only include Lactus-free meals', (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                _buildSwitchTile(
                    'Vegetraian', _vegetraian, 'Only include Vegetraian meals',
                    (newValue) {
                  setState(() {
                    _vegetraian = newValue;
                  });
                }),
                _buildSwitchTile('Vegan', _vegan, 'Only include Vegan meals',
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
