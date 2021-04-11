import 'package:flutter/material.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      initialRoute: GettingStarted.id,
      routes: {
        LoginScreen.id :(context) =>LoginScreen(),
        Nav.id :(context) =>Nav(),
        GettingStarted.id :(context) =>GettingStarted()
      },
    );
  }
}

