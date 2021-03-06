import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://backgrounddownload.com/wp-content/uploads/2018/09/android-navigation-drawer-background-image-1.jpg"),
                      fit: BoxFit.cover)),
              accountName: Text("Yo", style: TextStyle(color: Colors.white)),
              accountEmail: Text("yo@hotmail.es", style: TextStyle(color: Colors.white)),
              currentAccountPicture: Icon(Icons.person),
              onDetailsPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/register");
              },

          ),
          ListTile(
            title: Text("Mis recetas", style: TextStyle(fontSize: 18)),
            leading: Icon( Icons.book, color: Colors.green,),
            onTap: () {
              Navigator.pop(context);
              //Cambiamos a pantalla de recetas
              Navigator.pushNamed(context, "/recipes");
            },
          ),
          ListTile(
            title: Text("Mis favoritos", style: TextStyle(fontSize: 18)),
            leading: Icon( Icons.favorite, color: Colors.red,),
            onTap: () {
              Navigator.pop(context);
              //Cambiamos a pantalla de recetas
              Navigator.pushNamed(context, "/favorites");
            },
          ),
          ListTile(
            title: Text("Cerrar sesión", style: TextStyle(fontSize: 18)),
            leading: Icon( Icons.power_settings_new, color: Colors.cyan,),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, "/");
            },
          )
        ],
      ),
    );
  }
}
