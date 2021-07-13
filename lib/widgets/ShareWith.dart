import 'package:flutter/cupertino.dart';

class SharedWith extends StatefulWidget {
  const SharedWith({Key key}) : super(key: key);

  @override
  _SharedWithState createState() => _SharedWithState();
}

class _SharedWithState extends State<SharedWith> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Share with",
        style: CupertinoTheme.of(context).textTheme.navActionTextStyle,),
        SizedBox(height: 15.0),
        CupertinoButton(child: Text("+ Add @sign"), onPressed: (){
          //TODO add field
        })
      ],
    );
  }
}
