
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import'package:my_cert/fileoperations/pickfiles.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  List<String> docPaths;
  List<Widget>MyDocuments = [];
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
                                FocusedMenuItem(title: Text("Delete"),
                                    trailingIcon: Icon(
                                        Icons.delete,
                                      color: Colors.red,

                                    ) ,onPressed: () =>{
                                  removeDocuments(index)
                                }),
                              ],
                              menuBoxDecoration:BoxDecoration(
                                // color: Colors.green
                              ),
                              blurSize: 8,
                              blurBackgroundColor: Colors.indigoAccent,
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
          onPressed:_fileManager.getFile,
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
