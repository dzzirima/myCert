import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SharedWith extends StatefulWidget {
  const SharedWith({Key key}) : super(key: key);

  @override
  _SharedWithState createState() => _SharedWithState();
}

class _SharedWithState extends State<SharedWith> {
  //  this is where you add all the state variable
  final fields = [];
  void _addField(){
    fields.add('');
    setState(() {
    });
  }

  void _removeField(index){
    fields.removeAt(index);
    setState(() {
    });

    
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Share with",
        style: CupertinoTheme.of(context).textTheme.navActionTextStyle,),
        SizedBox(height: 15.0),
        for(var i = 0; i < fields.length ; i++)
        Row(
          children: [
            Expanded(child: CupertinoTextField(
              //padding: const EdgeInsets.all(18.0),
            ),
            ),
            CupertinoButton(child:
                Icon(CupertinoIcons.minus_circle),
                onPressed: (){
                _removeField(i);
                })
          ],
        ),
        CupertinoButton(child: Text("+ Add @sign"), onPressed: (){
          //TODO add field
          _addField();
        })
      ],
    );
  }
}
