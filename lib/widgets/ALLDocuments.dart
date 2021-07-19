import 'dart:convert';
import 'package:at_commons/at_commons.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_cert/fileoperations/MyFileManager.dart';
import 'package:my_cert/screens/AddDocument.dart';
import 'package:my_cert/widgets/DocumentCard.dart';
import 'package:my_cert/widgets/NoDocument.dart';
import 'package:my_cert/utils/GetDocument.dart';


class AllDocuments extends StatefulWidget {
  AllDocuments({Key key}) : super(key: key);


  @override
  _AllDocumentsState createState() => _AllDocumentsState();
}

class _AllDocumentsState extends State<AllDocuments> {
  Future<String>futureListOfDocuments;
  Future<List<AtKey>> futureListOfDocuments1;

  GetDocuments _getDocuments = GetDocuments();
  MyFileManager _fileManager = MyFileManager();

  @override
  void initState() {
    super.initState();

    // print(futureListOfDocuments1);
    // futureListOfDocuments = _getDocuments.getDocs();

    futureListOfDocuments1 =  _fileManager.getKeysFromServer();

  }
  
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text("All Documents"),
            trailing:CupertinoButton(
              padding:const EdgeInsets.all(5.0),

              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>AddDocument()
                  )
                );
              },
              child: Icon(
                CupertinoIcons.plus_app_fill,
                size: 30,
              )
            ) ,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
                FutureBuilder(
                    future:futureListOfDocuments1,
                    builder: (BuildContext context, AsyncSnapshot<List<AtKey>> snapshot) {

                      // String david = snapshot.toString();
                      // //print(david);
                      // var david2 = david.split("AsyncSnapshot<String>(ConnectionState.done, [");
                      // var david3 = json.encode(david2).split("AtKey");
                      // print(david3[1]);
                      // var david4 = json.decode(david3[1]);
                      // print(david4);
                      //
                      // print((david3[1]).runtimeType);
                      // print((david3[1]));
                      print(snapshot.data);
                      if(!snapshot.hasData){
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if(snapshot == null){
                        return  NoDocument();
                      }
                      return Column(
                        children:[
                          for(var index = 0 ;index < 10; index ++)
                            DocumentCard(id:index,nameOfDocument: "heh"),
                        ],
                      );
                    }
                ),

                //FutureBuilder(builder: builder)
                // for(var i = 0 ; i < 100 ; i++)
                //   Text("Hello summer")

              ]))
        ],
      )

    );
  }
}