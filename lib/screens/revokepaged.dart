import 'package:flutter/material.dart';




class RevokedPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.share
            //color: Colors.green[500],
          ),
          Container(
              padding: const EdgeInsets.all(8.0),
              child: Text('Shared Certificates'))
        ],
      ),
      centerTitle: true,
      actions: [
        PopupMenuButton <int>(
            onSelected: (item) => onSelected (context, item),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 0,
                child: Text('Revoke All'),
              ),
            ])
      ],
    ),
    body: Center(
      child: Text("No Shared Certificates \n Share your certificates today"),
    ),
  );

  void onSelected(BuildContext context, int item) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context)=> RevokedPage()),
    );


  }
}
