import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  GetDocuments _getDocuments = GetDocuments();

  @override
  void initState() {
    super.initState();
    futureListOfDocuments = _getDocuments.getDocs();
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
                    future:futureListOfDocuments,
                    builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
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
                            DocumentCard(nameOfDocument: "heh"),
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
