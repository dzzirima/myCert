import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_cert/screens/GettingStartedScreen.dart';
import 'package:at_demo_data/at_demo_data.dart' as at_demo_data;
import 'package:my_cert/nav/Nav.dart';
import 'package:my_cert/utils/service.dart';
import 'package:url_launcher/url_launcher.dart';

String atSign;

class LoginScreen extends StatefulWidget {
  static final String id = 'login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  ServerDemoService _serverDemoService = ServerDemoService.getInstance();
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit @my_cert'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: _onWillPop,
      child: new Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Text('Welcome to @my_cert'),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: Center(
          child: ListView(
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "",
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
                child: CircleAvatar(
                  radius: 150,
                  backgroundImage: AssetImage('assets/david.jpeg'),
                  backgroundColor: Colors.blueGrey,
                  foregroundColor: Colors.white,
                ),
              ),
              Container(
                width: 501,
                height: 250,
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
                        margin: EdgeInsets.all(12),
                        child: TextButton(
                            child: Text("Submit".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                )),
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.all(12)),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.red),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.red),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: BorderSide(color: Colors.red)))),
                            onPressed: _login),
                      ),
                      Container(
                        margin: EdgeInsets.all(12),
                        child: TextButton(
                            child: Text("Get an @sign",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                )),
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.all(12)),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.red),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.red),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        side: BorderSide(color: Colors.red)))),
                            onPressed: _launchURL),
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
    // If an atsign has been chosen to authenticate
    print(atSign);
    if (atSign != null) {
      // Re-running the build method
      FocusScope.of(context).unfocus();
      setState(() {
        // Shows the spinning icon until the atsign is successfully authenticated
        showSpinner = true;
      });

      // a json string necessary to authenticate for the first time
      // and key pairs are stored within this string
      String jsonData = _serverDemoService.encryptKeyPairs(atSign);

      // Utilizing the onboard method, passing in the atsign that has been
      // selected to authenticate
      _serverDemoService.onboard(atsign: atSign).then((value) async {
        // Push navigator to home screen and also preventing authenticated atsign
        // from returning to login screen
        Navigator.pushReplacementNamed(context, Nav.id);
      }).catchError((error) async {
        // First time authenticating with atsign will throw
        // 'atsign not found' error
        // onboard method looks for cached keys within device.
        // Authenticate will embed the necessary keys within the key chain
        await _serverDemoService.authenticate(atSign,
            // Passing the key pairs retrieved earlier in addition to the decrypt
            // key which is retireved from the at_demo_data file's list of
            // keys
            jsonData: jsonData,
            decryptKey: at_demo_data.aesKeyMap[atSign]);

        // Push navigator to home screen and also preventing authenticated atsign
        // from returning to login screen
        Navigator.pushReplacementNamed(context, Nav.id);
      });
    }
  }
}

  _launchURL() async {
    const url = 'https://atsign.com/get-an-sign/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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
//      await _serverDemoService.authenticate(atSign,
//           jsonData: jsonData, decryptKey: at_demo_data.aesKeyMap[atSign]);
//       Navigator.pushReplacementNamed(context, DashBoard.id);
//     });
//    }else{
//     Navigator.pushReplacementNamed(context, DashBoard.id);
//   }
// }

