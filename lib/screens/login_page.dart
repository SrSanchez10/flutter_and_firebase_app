import 'package:flutter/material.dart';
import 'package:final_proyect/screens/second_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  bool _loading = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String userName = "";
  String password = "";

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
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 60),
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.cyan[300],
              Colors.cyan[800],
            ])),
            child: Image.asset(
              "assets/images/logo.png",
              color: Colors.white,
              height: 200,
            ),
          ),
          Transform.translate(
            offset: Offset(0, -40),
            child: Center(
              child: SingleChildScrollView(
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 260, bottom: 20),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(labelText: "Usuario:"),
                          onSaved: (value) {
                            userName = value;
                          },
                          validator: (value){
                            if(value.isEmpty){
                              return "Este campo es obligatorio";
                            }
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: "Contraseña:"),
                          obscureText: true,
                          onSaved: (value) {
                            password = value;
                          },
                          validator: (value){
                            if(value.isEmpty){
                              return "Este campo es obligatorio";
                            }
                          },
                        ),
                        SizedBox(height: 40),
                        Theme(
                          data: Theme.of(context)
                              .copyWith(accentColor: Colors.white),
                          child: RaisedButton(
                            color: Theme.of(context).primaryColor,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            onPressed: () {
                              _login(context);
                            },
                            textColor: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Iniciar sesión"),
                                if (_loading)
                                  Container(
                                    height: 20,
                                    width: 20,
                                    margin: const EdgeInsets.only(left: 20),
                                    child: CircularProgressIndicator(),
                                  )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("¿No estas registrado?"),
                            FlatButton(
                                textColor: Theme.of(context).primaryColor,
                                onPressed: () {
                                  _showRegister(context);
                                },
                                child: Text("Registrarse"))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }

  void _login(BuildContext context) {
    if (!_loading) {
      if(_formKey.currentState.validate()) {
        _formKey.currentState.save();
        setState(() {
          _loading = true;
        });
        Navigator.pushReplacementNamed(context, "/home");
        //Aquí llamaríamos a la función de login del backend
      }
    }
  }

  void _showRegister(BuildContext context) {
    Navigator.of(context).pushNamed("/register");
  }
}
