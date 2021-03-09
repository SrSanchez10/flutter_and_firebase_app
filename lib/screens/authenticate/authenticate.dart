import 'package:firebase_app/screens/authenticate/register.dart';
import "package:flutter/material.dart";

import 'sign_in.dart';

class Authenticate extends StatefulWidget {
  Authenticate({Key key}) : super(key: key);

  @override
  _AuthenticateState createState() {
    return _AuthenticateState();
  }
}

class _AuthenticateState extends State<Authenticate> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool showSignIn = true;

  void toggleView(){
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {

    if (showSignIn){
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }

  }
}