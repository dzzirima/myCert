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

  String fileBytesString;
  String title;
  int fileSize;

  /// .............................working with @sign logic ................
  ServerDemoService _serverDemoService = ServerDemoService.getInstance();
  var uuid = Uuid();


  getFileFromDevice() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();
    //get the files from the picker
    if (result != null) {

      File file = File(result.files.single.path);
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


  saveFileToKeyChain(String atKey,data) async {

    String atSign = await _serverDemoService.getAtSign(); // get the user who is currently logged in
    // genarate the id which is diff for  each documennt

    AtKey document = AtKey();
    //await _serverDemoService.get(document);
    String description = "Build the next generation of privacy-first apps with the @platform";
    //document.key = uuid.v1();
    document.key = "document";

    document.sharedWith = atSign;
    // store the files in the key value chain
    await _serverDemoService.put(document,description);
    //await _serverDemoService.put(document2,description);

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

  getFileFromKeyChain() async {

    String atSign = await _serverDemoService.getAtSign();
    AtKey lookup = AtKey();
    lookup.sharedWith = atSign;
    lookup.key = "document";


    String response = await  _serverDemoService.get(lookup);
    // getting the at sign and print to the screen
    print("************************************************************************");
    print(response);
    print("************************************************************************");


  }
  getKeysFromServer() async {
    var result = await _serverDemoService.getAtKeys();
    print(result.length.toString());


    print("************************************************************************");
    result.forEach((key) {
      print(key.key.toString());
    });
    print("************************************************************************");


  }

}
