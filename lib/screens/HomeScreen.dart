import 'package:flutter/material.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  List<String> docPaths;
  void _getDocuments() async {
    final path = await FlutterDocumentPicker.openDocument();
    print(path);
    if (!mounted) return;
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
      Center(
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
                  if (docPaths != null)
                    Text(docPaths.join('\n'))
                ],
              ),
            ),
          ],
        )
      ),
      ),  
      floatingActionButton: FloatingActionButton.extended(
          onPressed: _getDocuments,
        icon:Icon(Icons.add),
        label: Text("Add Docs"),

      ),
    );
  }
}
