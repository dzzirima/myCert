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
    return MaterialApp(
      home: Scaffold(
        //backgroundColor: Colors.teal[200],
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Center(
              //   child: Text(
              //     '@my_cert',
              //     style: TextStyle(
              //
              //       fontSize: 40,
              //       color: Colors.indigo[900],
              //       fontWeight: FontWeight.bold,
              //       letterSpacing: 1.5,
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 20,
              //   width: 150,
              //   child: Divider(
              //     color: Colors.white,
              //   ),
              // ),
              Container(
                child: CircleAvatar(
                  radius: 120,
                  backgroundImage: AssetImage('assets/david.jpeg'),
                ),
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  border: new Border.all(
                    color: Colors.indigo[900],
                    width: 4.0,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
                width: 150,
                child: Divider(
                  color: Colors.white,
                ),
              ),
              Text(
                '\t \t Own \n \n    Build \n \n \t & Share your certifications',
                style: TextStyle(

                  fontSize: 20,
                  color: Colors.indigo[900],
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              SizedBox(
                height: 15,
                width: 150,
                child: Divider(
                  color: Colors.white,
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: TextButton(
                    child: Text("Get started".toUpperCase(),
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        )),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(8)),
                        foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(38.0),
                                side: BorderSide(color: Colors.red)))),
                    onPressed: _login),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _login() async {
    Navigator.pushReplacementNamed(context, LoginScreen.id);
  }
}
