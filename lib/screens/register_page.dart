import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:final_proyect/components/image_picker_widget.dart';


class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() {
    return _RegisterPageState();
  }
}

class _RegisterPageState extends State<RegisterPage> {
  bool _loading = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  String userName = "";
  String password = "";
  File imageFile;
  int gerner = 0;
  bool showPassword = false;

  @override
  void initState() {
    super.initState();
    //Comprobamos si vamos a editar un usuario
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
          ImagePickerWidget(
              imageFile: this.imageFile,
              onImageSelected: (File file) {
                setState(() {
                  imageFile = file;
                });
              }),
          SizedBox(
            child: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              iconTheme: IconThemeData(color: Colors.white),
            ),
            height: kToolbarHeight + 25,
          ),
          Center(
            child: Transform.translate(
              offset: Offset(0, -40),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                margin: const EdgeInsets.only(
                    left: 20, right: 20, top: 260, bottom: 20),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                  child: ListView(children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(labelText: "Usuario:"),
                          onSaved: (value) {
                            userName = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Este campo es obligatorio";
                            }
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "Contraseña:",
                              suffixIcon: IconButton(
                                icon: Icon(showPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    showPassword = !showPassword;
                                  });
                                },
                              )),
                          obscureText: !showPassword,
                          onSaved: (value) {
                            password = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Este campo es obligatorio";
                            }
                          },
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              "Género",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700]),
                            ),
                            Expanded(
                                child: RadioListTile(
                              title: Text("Masculino"),
                              value: 0,
                              onChanged: (value) {
                                setState(() {
                                  gerner = value;
                                });
                              },
                            )),
                            Expanded(
                                child: RadioListTile(
                                    title: Text("Femenino"),
                                    value: 1,
                                    onChanged: (value) {
                                      setState(() {
                                        gerner = value;
                                      });
                                    }))
                          ],
                        ),
                        SizedBox(height: 20),
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
                                Text("Registrar"),
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
                        SizedBox(height: 20)
                      ],
                    ),
                  ]),
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
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();
        setState(() {
          _loading = true;
        });
        Navigator.pushReplacementNamed(context, "/home");
        //Aquí llamaríamos a la función de registrase del backend
      }
    }
  }

  void _showRegister(BuildContext context) {
    Navigator.of(context).pushNamed("/register");
  }
}
