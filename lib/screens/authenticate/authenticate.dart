import 'package:firebase_app/screens/authenticate/sign_in.dart';
import "package:flutter/material.dart";

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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: SignIn(),
    );
  }
}