import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_cert/screens/AddDocument.dart';


class AllDocuments extends StatelessWidget {
  const AllDocuments({Key key}) : super(key: key);

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
                for(var i = 0 ; i < 100 ; i++)
                  Text("Hello summer")

              ]))
        ],
      )

    );
  }
}
