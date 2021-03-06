import 'package:flutter/material.dart';
import 'package:final_proyect/components/my_drawer.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
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
        title: Text("My CookBook"),
      ),
      drawer: MyDrawer(),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (BuildContext context, int index){
          final recipe = recipes[index];
          return Card(
            child: Text(recipe),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {

        },
      ),
    );
  }
}
