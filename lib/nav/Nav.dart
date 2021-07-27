import 'package:flutter/material.dart';
import 'package:my_cert/screens/HomeScreen.dart';
import 'package:my_cert/screens/AlertsScreen.dart';
import 'package:my_cert/screens/ProfileScreen.dart';
import 'package:my_cert/screens/revokepaged.dart';
import 'package:my_cert/widgets/ALLDocuments.dart';

class Nav extends StatefulWidget {
  static final String id = 'nav';
  @override
  _NavState createState() => _NavState();
}
class _NavState extends State<Nav> {
  int selectedIndex = 0;
  List<Widget> widgetOptions = <Widget>[
    //Home(), // un comment here to get the old home screen
    AllDocuments(),
    //Alerts(),
    Profile(),
    RevokedPage(),
  ];

  // functionn detect the tapped index
  void onItemTap(int index){
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //title: Text("Share hfhd dfdfh df"),
      //),
      body:Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const  <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon:Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon:Icon(Icons.share),label: "Shared"),
          BottomNavigationBarItem(icon:Icon(Icons.person_pin),label: "Profile"),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTap,
      ),
    );
  }
}