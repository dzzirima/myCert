
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import'package:my_cert/fileoperations/MyFileManager.dart';
import 'package:my_cert/models/Document.dart';
import 'package:my_cert/screens/AddDocument.dart';
import 'package:my_cert/screens/DocumentDetailScreen.dart';
import 'package:my_cert/widgets/DocumentCard.dart';
import 'package:my_cert/utils/GetDocument.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  Future<String>futureListOfDocuments;
  GetDocuments _getDocuments = GetDocuments();

  @override
  void initState() {
    super.initState();
    futureListOfDocuments = _getDocuments.getDocs();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff0ece3),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.description_outlined
                //color: Colors.green[500],
              ),
              Container(
                //padding: const EdgeInsets.all(8.0),
                child: Text('Certificates & Resumes'),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:FutureBuilder(
              future:futureListOfDocuments,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                print(snapshot);
                if(!snapshot.hasData){
                  return Center(
                    child: CircularProgressIndicator(),
                  );}
                  return ListView(
                    children:[
                      for(var index = 0 ;index < 2; index ++)
                        Text("Hello mandisa")
                    ],
                  );
                }
              ),
          )
        ),
        floatingActionButton: FloatingActionButton.extended(
          //_fileManager.getFile,
          icon:Icon(Icons.add),
          label: Text("Add Docs"),
          onPressed:() async {
            Navigator.push(
                context,
                MaterialPageRoute(
                  // builder: (BuildContext context) =>DocumentDetailScreen(document: doc),
                  builder: (BuildContext context) =>AddDocument(),
                ));
          }
        ),
      ),
    );
  }
}

