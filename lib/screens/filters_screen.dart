import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";
  final Function saveFilters;
  FiltersScreen(this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _buildSwitchListTile(
    String title,
    String subtitle,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      value: currentValue,
      subtitle: Text(subtitle),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.save,
            ),
            onPressed: widget.saveFilters,
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust Your Meal Selection",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  'Gluten-Free',
                  'Only Include Gluten-Free Meals.',
                  _glutenFree,
                  (newvalue) {
                    setState(() {
                      _glutenFree = newvalue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Lactose-Free',
                  'Only Include Lactose-Free Meals.',
                  _lactoseFree,
                  (newvalue) {
                    setState(() {
                      _lactoseFree = newvalue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Vegetarian',
                  'Only Include Vegetarian Meals.',
                  _vegetarian,
                  (newvalue) {
                    setState(() {
                      _vegetarian = newvalue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only Include Vegan Meals.',
                  _vegan,
                  (newvalue) {
                    setState(() {
                      _vegan = newvalue;
                    });
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
