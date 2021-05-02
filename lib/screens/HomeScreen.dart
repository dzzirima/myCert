import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child:CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 53.0,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/david.jpeg'),
                    backgroundColor: Colors.blueGrey,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
            ),
              Expanded(
                flex: 2,
                child: ListView(
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Container(
                    height: 50,
                    color: Colors.amber[600],
                    child: const Center(child: Text('Entry A')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[500],
                    child: const Center(child: Text('Entry B')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[100],
                    child: const Center(child: Text('Entry C')),
                  ),
                ],
              ),
            ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {// Add your onPressed code here!
            print("The floating action buton was pressed 22");
          },
        child: Icon(Icons.add),

      ),
    );
  }
}
