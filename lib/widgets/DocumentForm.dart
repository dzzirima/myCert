

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_cert/models/Document.dart';
import 'package:my_cert/widgets/ShareWith.dart';

class DocumentForm extends StatefulWidget {
  const DocumentForm({Key key,@required this.onSubmit}) : super(key: key);

  // submission of the frm data will be doen in the parent widget
  final ValueChanged<Document> onSubmit;

  @override
  _DocumentFormState createState() => _DocumentFormState();
}

class _DocumentFormState extends State<DocumentForm> {
  final values = Document();
  String fileName = "Pic  A file";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        CupertinoTextField(
          placeholder: "Custome Doc Title",
          padding: const EdgeInsets.all(15),
          onChanged: (value){
            // persist the changes
            values.title = value;
          },

        ),
        SizedBox(height: 10),
        CupertinoTextField(
          placeholder: "Description",
          padding: const EdgeInsets.all(15),
          onChanged: (value){
            // persist the changes
            values.description = value;
          },

        ),
        SizedBox(height: 10),
        CupertinoTextField(
          readOnly: true,
          placeholder:  '$fileName',
          padding: const EdgeInsets.all(15),
          onChanged: (value){
            // persist the changes
            // pick document locati
          },
          suffix: MaterialButton(
            //color:Colors.blue,
            onPressed: (){
              setState(() {
                //values.fileBytes = "file name" as Uint8List;
                fileName = "Masters in Programming";
              });
            },
            child: Icon(
              Icons.add,
              color:Colors.blue,
              size: 30.0,
            ),
          ),
        ),
        SizedBox(height: 25.0),
        SharedWith(
          onUpdate: (value){
            values.sharedWith = value;
          },
        ),
        SizedBox(height: 40.0),
        CupertinoButton(
          color:Colors.blue,
            child: Text("Save Document"), onPressed: (){
          //TODO Save the document
          widget.onSubmit(values);
        })
      ],

    );
  }
}
