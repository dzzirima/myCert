

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_cert/models/Document.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class DocumentDetailScreen extends StatelessWidget {
  // Declare a field that holds the Todo.
  final Document document;

  // In the constructor, require a Todo.
  DocumentDetailScreen({Key key, this.document}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Document Name"),
      ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
            child: SfPdfViewer.memory(jsonDecode(document.fileBytesString))
         )
      );
  }
}