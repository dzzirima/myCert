import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';
import 'package:my_cert/screens/AddDocument.dart';

class NoDocument extends StatelessWidget {
  const NoDocument({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 100.0,),
          Icon(
            CupertinoIcons.square_stack_3d_down_right,
            color: Colors.black12,
            size: 50,
          ),
          SizedBox(height: 10.0),
          Text(
            "No Document to View",
            style: TextStyle(color: Colors.grey),
          ),
          CupertinoButton(child: Text("Add Your First Document"),
              onPressed:(){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      // builder: (BuildContext context) =>DocumentDetailScreen(document: doc),
                      builder: (BuildContext context) =>AddDocument(),
                    ));
              })
        ],
      ),
    );
  }
}

