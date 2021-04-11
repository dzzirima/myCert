import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:at_demo_data/at_demo_data.dart' as at_demo_data;
import 'package:my_cert/nav/Nav.dart';

String atSign;

class LoginScreen extends StatefulWidget {
  static final String id = 'login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  // ServerDemoService _serverDemoService = ServerDemoService.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '@my_cert',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(

        child: Center(
          child: ListView(
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text("Welcome to @my_cert",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'lobster',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                child:  CircleAvatar(
                  radius: 150,
                  backgroundImage: AssetImage('assets/david.jpeg'),
                  backgroundColor: Colors.blueGrey,
                  foregroundColor: Colors.white,
                ),
              ),

              Container(
                width: 500,
                height: 220,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.white,
                  elevation: 0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/atsign.png',
                            height: 50.0,
                            width: 50.0,
                          ),
                        ),
                        title: Text(
                          '',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                        subtitle: DropdownButton<String>(
                          hint: Text('\tPick an @sign'),
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                          ),
                          iconSize: 24,
                          elevation: 16,
                          style:
                          TextStyle(fontSize: 20.0, color: Colors.black87),
                          underline: Container(
                            height: 2,
                            color: Colors.deepOrange,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              atSign = newValue;
                            });
                          },
                          value: atSign != null ? atSign : null,
                          items: at_demo_data.allAtsigns
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        child: TextButton(
                            child: Text(
                                "Get started".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 35,
                                  color: Colors.white,
                                )
                            ),
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                        side: BorderSide(color: Colors.red)
                                    )
                                )
                            ),
                            onPressed: _login
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // TODO: Write _login method
  /// Use onboard() to authenticate via PKAM public/private keys.
  _login() async {
    print("mkjdkjf");
    Navigator.pushReplacementNamed(context, Nav.id);

  }

  //   FocusScope.of(context).unfocus();
  //   setState(() {
  //     showSpinner = true;
  //   });
  //   Navigator.pushReplacementNamed(context, DashBoard.id);
  //   String jsonData = _serverDemoService.encryptKeyPairs(atSign);
  //   if (atSign != null) {
  //     _serverDemoService.onboard(atsign: atSign).then((value) async {
  //       Navigator.pushReplacementNamed(context, DashBoard.id);
  //     }).catchError((error) async {
  //       await _serverDemoService.authenticate(atSign,
  //           jsonData: jsonData, decryptKey: at_demo_data.aesKeyMap[atSign]);
  //       Navigator.pushReplacementNamed(context, DashBoard.id);
  //     });
  //   }else{
  //     Navigator.pushReplacementNamed(context, DashBoard.id);
  //   }
  // }
}
