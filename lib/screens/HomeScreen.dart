import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  List<String> docPaths;
  List<Widget>MyDocuments = [];
  List<String>documentNames = [];

  void removeDocuments(index){
    setState(() {
      MyDocuments.removeAt(index);
    });
  }

  void _getDocuments() async {
    var path = await FlutterDocumentPicker.openDocument();
    var name;
    var extension;
    var fileUpLoadedDate = (DateFormat.yMMMd().format(DateTime.now()));
    try{
      if(path != null) {
        name = path.split('/').last;
        extension = name.split('.').last;

        setState(() {
          MyDocuments.add(DocumentCard(nameOfDocument:name ,icon: Icons.picture_as_pdf_sharp,uploadDate:fileUpLoadedDate));
          documentNames.add(name.toString());
          print(extension);
        });
      } else {
        // User canceled the picker
      }
    }
    catch(err){
      print("Failed to pic the documents Sir ..................");
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.description_outlined
                //color: Colors.green[500],
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Text('Certificates & Resumes'),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Container(
              //     child:CircleAvatar(
              //       backgroundColor: Colors.black,
              //       radius: 53.0,
              //       child: CircleAvatar(
              //         radius: 50,
              //         backgroundImage: AssetImage('assets/david.jpeg'),
              //         backgroundColor: Colors.blueGrey,
              //         foregroundColor: Colors.white,
              //       ),
              //     ),
              //   ),
              // ),
                Expanded(
                  flex: 2,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: MyDocuments.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: (){
                            print(documentNames[index]);
                            },
                          child: FocusedMenuHolder(
                              menuItems: [
                                FocusedMenuItem(title: Text("Share"),trailingIcon: Icon(Icons.share) ,onPressed: () =>{
                                  print(documentNames[index]),
                                }),
                                FocusedMenuItem(title: Text("Delete"),trailingIcon: Icon(Icons.delete) ,onPressed: () =>{
                                  removeDocuments(index)
                                }),
                              ],
                              menuBoxDecoration:BoxDecoration(
                                // color: Colors.green
                              ),
                              blurSize: 8,
                              blurBackgroundColor: Colors.white,
                              menuWidth: MediaQuery.of(context).size.width * 0.5,
                              menuItemExtent: 50,
                              duration: Duration(seconds: 0),
                              animateMenuItems: false,
                              menuOffset: 10,
                              openWithTap: true,
                              onPressed: () {},
                              child: MyDocuments[index]),
                      );
                    }),
              ),
            ],
          )
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _getDocuments,
          icon:Icon(Icons.add),
          label: Text("Add Docs"),
        ),
      ),
    );
  }
}
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
