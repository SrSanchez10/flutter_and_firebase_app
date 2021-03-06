import 'package:final_proyect/screens/details_page.dart';
import 'package:final_proyect/screens/my_recipes_page.dart';
import 'package:flutter/material.dart';
import 'package:final_proyect/screens/login_page.dart';
import 'package:final_proyect/screens/my_favorites.dart';
import 'package:final_proyect/screens/register_page.dart';
import 'package:final_proyect/screens/second_page.dart';
import 'package:final_proyect/screens/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      //home:  MyHomePage(),
      initialRoute: "/",
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.cyan,
          accentColor: Colors.cyan[300],
          accentIconTheme: IconThemeData(color: Colors.white),
          appBarTheme: AppBarTheme(
              textTheme: TextTheme(title: TextStyle(color: Colors.white, fontSize: 22)),
              iconTheme: IconThemeData(color: Colors.white)
          )
      ),
      routes: {
        "/": (BuildContext context) => LoginPage(),
        "/home": (BuildContext context) => HomePage(),
        "/second": (BuildContext context) => SecondPage(),
        "/register": (BuildContext context) =>  RegisterPage(),
        "/favorites": (BuildContext context) =>  MyFavoritesPage(),
        "/recipes": (BuildContext context) =>  MyRecipesPage(),
        "/details": (BuildContext context) =>  DetailsPage(),

      },
    );
  }
}
