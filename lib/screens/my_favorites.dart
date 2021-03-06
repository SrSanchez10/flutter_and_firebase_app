import 'package:flutter/material.dart';

class MyFavoritesPage extends StatefulWidget {
  MyFavoritesPage({Key key}) : super(key: key);

  @override
  _MyFavoritesPage createState() {
    return _MyFavoritesPage();
  }
}

class _MyFavoritesPage extends State<MyFavoritesPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<String> recipes = ["Tortilla","Patatas Bravas","Raxo de cerdo","Churrasco"];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Mis Favoritos"),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (BuildContext context, int index){
          final recipe = recipes[index];
          return Card(
            child: Text(recipe),
          );
        },

      ),

    );
  }
}
