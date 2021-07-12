

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
        isThreeLine: true,
        //leading:Image.asset('assets/doc.png'),
        leading: Image.asset(
          'assets/pdf.png',
          height: 50.0,
          width: 50.0,
        ),
        title: Text(nameOfDocument.toString().toUpperCase()),
        subtitle: Text("12/12/2021 -12MB\nSharedby :@David,@Tafadzwa,@hello and 20 others"),
        trailing: Icon(Icons.star_border),
      ),
    );
  }
}