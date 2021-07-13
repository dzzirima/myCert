import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_cert/screens/AddDocument.dart';
import 'package:my_cert/screens/GettingStartedScreen.dart';
import 'package:my_cert/screens/LoginScreen.dart';
import 'nav/Nav.dart';void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GettingStarted(),
      routes: {
        LoginScreen.id :(context) =>LoginScreen(),
        Nav.id :(context) =>Nav(),
        GettingStarted.id :(context) =>GettingStarted(),
        AddDocument.id :(context) =>AddDocument()
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void startTimer(){
    Timer(Duration(seconds: 7), (){
      Navigator.pushReplacementNamed(context, LoginScreen.id);

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Image.asset('assets/splashMain.png', width: MediaQuery.of(context).size.width*.5,),
        )
    );
  }

}

