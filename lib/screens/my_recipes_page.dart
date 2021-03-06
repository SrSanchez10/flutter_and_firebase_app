import 'package:flutter/material.dart';

class MyRecipesPage extends StatefulWidget {
  MyRecipesPage({Key key}) : super(key: key);

  @override
  _MyRecipesPage createState() {
    return _MyRecipesPage();
  }
}

class _MyRecipesPage extends State<MyRecipesPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<String> recipes = ["Raxo de pollo","Churrasco"];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Mis Recetas"),
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
