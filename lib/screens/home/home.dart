
import 'package:firebase_app/models/brew.dart';
import 'package:firebase_app/screens/home/settings_form.dart';
import 'package:flutter/material.dart';

import '../services/auth.dart';
import '../services/database.dart';
import 'package:provider/provider.dart';

import 'brew_list.dart';

class Home extends StatelessWidget {
  Home({Key key}) : super(key: key);

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
          child: SettingsForm(),
        );
      });
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Brew Crew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () async { await _auth.signOut(); }, icon: Icon(Icons.person), label: Text('Logout')),
            FlatButton.icon(onPressed: () => _showSettingsPanel(), icon: Icon(Icons.settings), label: Text('settings'))
          ],
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/coffee_bg.png'),
                fit: BoxFit.cover
              )
            ),
            child: BrewList()),
      ),
    );
  }
}
