import 'package:flutter/material.dart';
import 'package:my_cert/screens/revokedpage.dart';

class Alerts extends StatefulWidget {
  @override
  _AlertsState createState() => _AlertsState();
}

class _AlertsState extends State<Alerts> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.share
                  //color: Colors.green[500],
                  ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Text('Shared Certificates'),
              ),
            ],
          ),
          centerTitle: true,
          actions: [
            PopupMenuButton<int>(
                onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 0,
                        child: Text('Revoke All'),
                      ),
                    ])
          ],
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 50,
              child: Row(
                
                children: [
                  
                  Icon(Icons.picture_as_pdf),
                  Text('Transcript.pdf'),
                  Positioned(child: 
                  PopupMenuButton<int>(
                    
                      onSelected: (item) => onSelected(context, item),
                      itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 0,
                              child: Text('Revoke'),
                            ),
                          ])
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              child: Row(
                children: [
                  Icon(Icons.picture_as_pdf),
                  Text('Advanced Flutter Certficate.pdf'),
                  PopupMenuButton<int>(
                      onSelected: (item) => onSelected(context, item),
                      itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 0,
                              child: Text('Revoke'),
                            ),
                          ])
                ],
              ),
            ),
            Container(
              height: 50,
              child: Row(
                children: [
                  Icon(Icons.picture_as_pdf),
                  Text('David Zirima Python Basics.pdf'),
                  PopupMenuButton<int>(
                      onSelected: (item) => onSelected(context, item),
                      itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 0,
                              child: Text('Revoke'),
                            ),
                          ])
                ],
              ),
            ),
          ],
          //Center(
          //  child: Text("Shared"),
          //),
        ),
      ),
    );
  }

  void onSelected(BuildContext context, int item) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => RevokedPage()),
    );
  }
}


