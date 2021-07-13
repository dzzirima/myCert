import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class SharedWith extends StatefulWidget {
  SharedWith({Key key, @required this.onUpdate}) : super(key: key);

  final ValueChanged <List<Map<String,String>>> onUpdate;

  final uuid = Uuid();

  @override
  _SharedWithState createState() => _SharedWithState();
}

class _SharedWithState extends State<SharedWith> {
  //  this is where you add all the state variable
  final List<Map<String ,String>>fields = [];
  void _addField(){
    fields.add({widget.uuid.v1():""});
    setState(() {

    });
  }

  void _removeField(index){
    fields.removeAt(index);
    widget.onUpdate(fields);
    setState(() {
    });
  }
  void _updateField(String value ,int index){
    // get the item which need to be updated
    final key = fields[index].keys.first;
    fields[index][key] = value;
    widget.onUpdate(fields);
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
          key: ValueKey(fields[i].keys.first),
          children: [
            Expanded(child: CupertinoTextField(
              //padding: const EdgeInsets.all(18.0),
              onChanged: (value){
                _updateField(value,i);
              },
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
