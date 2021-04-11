import 'package:flutter/material.dart';

import 'LoginScreen.dart';


class GettingStarted extends StatefulWidget {
  static final String id = 'gettingStarted';
  @override
  _GettingStartedState createState() => _GettingStartedState();
}

class _GettingStartedState extends State<GettingStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // ignore: deprecated_member_use
        child: RaisedButton(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
          onPressed: _login,
          padding: EdgeInsets.all(10.0),
          color: Colors.white,
          textColor: Color.fromRGBO(0, 160, 227, 1),
          child: Text("Go To Login Page",
                  style: TextStyle(fontSize: 15)),
    ),
    ));
  }

  _login() async {

    Navigator.pushReplacementNamed(context, LoginScreen.id);

  }
}
