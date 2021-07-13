import 'package:flutter/cupertino.dart';
import 'package:my_cert/models/Document.dart';
import 'package:my_cert/widgets/DocumentForm.dart';

class AddDocument extends StatelessWidget {
  static final String id = 'addDocument';
  const AddDocument({Key key}) : super(key: key);

  // submission of data will done in this parent form
  void _addDocument(BuildContext context , Document values){
    print('submiting thes values $values');

  }

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
                  DocumentForm(onSubmit: (values){
                    _addDocument(context,values);

                  },)
                ]),
              ))
        ],
      ),
    );
  }
}
