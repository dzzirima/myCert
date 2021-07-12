
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import'package:my_cert/fileoperations/pickfiles.dart';
import 'package:my_cert/screens/DocumentDetailScreen.dart';
import 'package:my_cert/widgets/DocumentCard.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  List<String> docPaths;
  List <DocumentCard> MyDocuments = [];
  DocumentCard doc1 = DocumentCard(nameOfDocument: "david",icon: Icons.dangerous,uploadDate: "today",);

  List<String>documentNames = [];
  MyFileManager _fileManager = MyFileManager();

  void removeDocuments(index){
    setState(() {
      MyDocuments.removeAt(index);
    });
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
            child: ListView(
              children: [
               DocumentCard(nameOfDocument: "david",icon: Icons.dangerous,uploadDate: "today"),
                DocumentCard(nameOfDocument: "david",icon: Icons.dangerous,uploadDate: "today"),
                DocumentCard(nameOfDocument: "david",icon: Icons.dangerous,uploadDate: "today"),
                DocumentCard(nameOfDocument: "david",icon: Icons.dangerous,uploadDate: "today"),
                DocumentCard(nameOfDocument: "david",icon: Icons.dangerous,uploadDate: "today"),
                DocumentCard(nameOfDocument: "david",icon: Icons.dangerous,uploadDate: "today"),
                DocumentCard(nameOfDocument: "david",icon: Icons.dangerous,uploadDate: "today"),
                DocumentCard(nameOfDocument: "david",icon: Icons.dangerous,uploadDate: "today"),
                DocumentCard(nameOfDocument: "david",icon: Icons.dangerous,uploadDate: "today"),
                DocumentCard(nameOfDocument: "david",icon: Icons.dangerous,uploadDate: "today"),
                DocumentCard(nameOfDocument: "david",icon: Icons.dangerous,uploadDate: "today"),
                DocumentCard(nameOfDocument: "david",icon: Icons.dangerous,uploadDate: "today"),
                DocumentCard(nameOfDocument: "david",icon: Icons.dangerous,uploadDate: "today"),
                DocumentCard(nameOfDocument: "david",icon: Icons.dangerous,uploadDate: "today"),
                DocumentCard(nameOfDocument: "david",icon: Icons.dangerous,uploadDate: "today"),
                DocumentCard(nameOfDocument: "david",icon: Icons.dangerous,uploadDate: "today"),
                DocumentCard(nameOfDocument: "david",icon: Icons.dangerous,uploadDate: "today"),
                DocumentCard(nameOfDocument: "david",icon: Icons.dangerous,uploadDate: "today"),
                DocumentCard(nameOfDocument: "david",icon: Icons.dangerous,uploadDate: "today"),
                DocumentCard(nameOfDocument: "david",icon: Icons.dangerous,uploadDate: "today"),
                DocumentCard(nameOfDocument: "david",icon: Icons.dangerous,uploadDate: "today"),
              ],
            ),
          )
        ),
        floatingActionButton: FloatingActionButton.extended(
          //_fileManager.getFile,
          icon:Icon(Icons.add),
          label: Text("Add Docs"),
          onPressed:() async {
            var doc = await _fileManager.getFile();
            print(doc);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>DocumentDetailScreen(document: doc,),
                ));
          }
        ),
      ),
    );
  }
}

