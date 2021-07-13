import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_cert/widgets/ShareWith.dart';

class DocumentForm extends StatefulWidget {
  const DocumentForm({Key key}) : super(key: key);

  @override
  _DocumentFormState createState() => _DocumentFormState();
}

class _DocumentFormState extends State<DocumentForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        CupertinoTextField(
          placeholder: "Custome Doc Name",
          padding: const EdgeInsets.all(15),
          onChanged: (value){
            // persist the changes

          },

        ),
        SizedBox(height: 10),
        CupertinoTextField(
          placeholder: "Custome Doc Name",
          padding: const EdgeInsets.all(15),
          onChanged: (value){
            // persist the changes

          },

        ),
        SizedBox(height: 10),
        CupertinoTextField(
          placeholder: "Custome Doc Name",
          padding: const EdgeInsets.all(15),
          onChanged: (value){
            // persist the changes

          },

        ),
        SizedBox(height: 25.0),
        SharedWith(),
        SizedBox(height: 40.0),
        CupertinoButton(
          color:Colors.blue,
            child: Text("Save Document"), onPressed: (){
          //TODO Save the document
        })
      ],

    );
  }
}
