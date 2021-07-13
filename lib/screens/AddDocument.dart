import 'package:flutter/cupertino.dart';

class AddDocument extends StatelessWidget {
  static final String id = 'addDocument';
  const AddDocument({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar:CupertinoNavigationBar(
        middle: Text("Add Document"),
      ),
      child: CustomScrollView(
        slivers: [
          SliverSafeArea(
            minimum: const EdgeInsets.all(15.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  CupertinoTextField(
                    placeholder: "Custome Doc Name",
                    padding: const EdgeInsets.all(15),
                  )
                ]),
              ))
        ],
      ),
    );
  }
}
