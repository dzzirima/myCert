

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DocumentCard extends StatelessWidget {
  DocumentCard({@required  this.nameOfDocument,this.icon,this.uploadDate});
  final String nameOfDocument;
  final IconData icon;
  final uploadDate;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ListTile(
        leading:Icon(icon),
        title: Text(nameOfDocument.toString().toUpperCase()),
        subtitle: Text("Uploaded : ${uploadDate.toString()}"),
        trailing: Icon(Icons.more_vert),
      ),
    );
  }
}