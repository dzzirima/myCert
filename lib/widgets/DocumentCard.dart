

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_cert/screens/DocumentDetailScreen.dart';

class DocumentCard extends StatelessWidget {
  DocumentCard({Key key ,@required  this.nameOfDocument,this.icon,this.uploadDate , @required this.id});
  final String nameOfDocument;
  final IconData icon;
  final uploadDate;
  final id;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: (){
        // get the file bytes of the file
        //TODO get the get the file from keychain and view it on the other side
        showCupertinoModalPopup(
            context: context,
            builder: (context) =>DocumentDetailScreen()
        );




        print('hello summer$id');
      },
      child: Card(
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
      ),
    );
  }
}