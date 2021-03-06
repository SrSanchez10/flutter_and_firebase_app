import 'package:firebase_app/models/user.dart';
import 'package:firebase_app/screens/authenticate/authenticate.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

import 'home/home.dart';

class Wrapper extends StatelessWidget {
  Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    if (user == null){
      return Authenticate();
    } else {
      return Home();
    }

  }
}
