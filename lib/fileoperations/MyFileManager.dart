// this file contains method of picking up files and manipulatig  them

import 'dart:convert';
import 'dart:io';
import 'package:uuid/uuid.dart';

import 'dart:typed_data';
import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:file_picker/file_picker.dart';
import 'package:my_cert/models/Document.dart';
import 'package:my_cert/utils/service.dart';
import 'package:at_commons/at_commons.dart';


class MyFileManager {

  late String fileBytesString;
  late String title;
  late int fileSize;

  /// .............................working with @sign logic ................
  ClientService _serverDemoService = ClientService.getInstance();
  var uuid = Uuid();


  getFileFromDevice() async {
    FilePickerResult result = (await FilePicker.platform.pickFiles())!;
    //get the files from the picker
    if (result != null) {

      File file = File(result.files.single.path!);
      Uint8List temp  = await file.readAsBytes();
      fileBytesString = jsonEncode(temp);
      title = result.files.first.name;

      var doc = new Document();
      doc.title = this.title;
      doc.fileSize = result.files.first.size;
      doc.fileBytesString =fileBytesString;
      return doc;
    }
  }

  // preview the files


  saveFileToKeyChain(Document _document) async {
    print('document sent over : $_document');

    String atSign = (await _serverDemoService.getAtSign())!; // get the user who is currently logged in

    AtKey document = AtKey();
    //await _serverDemoService.get(document);
    String description = "Build the next generatio";
    document.key = uuid.v1();
    // document.key = "document";

    document.sharedWith = atSign;

    // store the files in the key value chain
    await _serverDemoService.put(document,_document.toString());


    // //await _serverDemoService.put(document, fileBytes.toString());
    // // var atClientPreference = await _serverDemoService.getAtClientPreference();
    // // await AtClientImpl.createClient(
    // //     atSign, "my_cert", atClientPreference);
    // // var atClient = await AtClientImpl.getClient(atSign);
    // var streamResult = await _serverDemoService.sendFile(atSign, result.files.single.path);
    //
    //
    // String value = await _serverDemoService.get(document);
    // //print(value);
    //
    //

  }

  getFileFromKeyChain(String key) async {

    String atSign = await _serverDemoService.getAtSign() as String;
    AtKey lookup = AtKey();
    lookup.sharedWith = atSign;
    lookup.key = key;


    String response = await  _serverDemoService.get(lookup);
    // getting the at sign and print to the screen
    print("************************The actual documents************************************************");
    print(response);
    print("*************************End of Actual Document***********************************************");


  }
  Future <List<AtKey>> getKeysFromServer() async {
   List<AtKey>  result = await _serverDemoService.getAtKeys();
   //print(result);


   // print("************************************************************************");
   // result.forEach((key) {
   //   print(key.key.toString());
   // });
   // print("************************************************************************");
   // return  result; print(result.length.toString());
    return result;

  }


}
