// this file contains method of picking up files and manipulatig  them

import 'dart:convert';
import 'dart:io';

import 'dart:typed_data';
import 'package:at_client_mobile/at_client_mobile.dart';


import 'package:file_picker/file_picker.dart';
import 'package:my_cert/models/Document.dart';
import 'package:my_cert/utils/service.dart';
import 'package:at_commons/at_commons.dart';


class MyFileManager {

  Uint8List fileBytes;
  String title;

  getFile() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();
    //get the files from the picker
    if (result != null) {
      //fileBytes = result.files.first.bytes;
      File file = File(result.files.single.path);

      fileBytes = await file.readAsBytes();

      title = result.files.first.name;
      // print(this.fileBytes);
      // print(this.title);

      // return file name and filebytes which will get from the keychain
      // var doc = new Document(this.title, this.fileBytes);
      var doc = new Document();
      return doc;

      // // Upload file
      // //await FirebaseStorage.instance.ref('uploads/$fileName').putData(fileBytes);
      //
      // // store the values inthe keychain
      //
      // ServerDemoService _serverDemoService = ServerDemoService.getInstance();
      // String atSign = await _serverDemoService.getAtSign();
      //
      //
      // AtKey document = AtKey();
      // //await _serverDemoService.get(document);
      // String description = "Build the next generation of privacy-first apps with the @platform";
      // document.key = "document";
      // document.sharedWith = atSign;
      // // store the files in the key value chain
      // await _serverDemoService.put(document,jsonEncode(this.fileBytes));
      //
      // AtKey lookup = AtKey();
      // lookup.key = "document";
      // lookup.sharedWith = atSign;
      //
      //
      // String response = await  _serverDemoService.get(lookup);
      // // getting the at sign and print to the screen
      // print("************************************************************************");
      // print("File Name >>>"+ this.fileName);
      // print("FileDescription >>>"+response);
      // print("************************************************************************");
      //
      //
      //
      //
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
  }

  // preview the files


  // saveFileToKeyChain(String atKey,data) async {
  //
  // }

}
