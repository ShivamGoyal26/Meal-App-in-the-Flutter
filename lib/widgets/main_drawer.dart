import 'package:flutter/material.dart';
import 'package:meal_app_2/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListView(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        (title),
        style: TextStyle(
            fontFamily: 'OpenSans', fontSize: 18, fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColor,
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 26,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListView(
            "Meals",
            Icons.restaurant,
            (){
              Navigator.of(context).pushReplacementNamed('/');
            }
          ),
          buildListView(
            "Filters",
            Icons.settings,
            (){
              Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
            }
          ),
        ],
      ),
    );
  }
}
