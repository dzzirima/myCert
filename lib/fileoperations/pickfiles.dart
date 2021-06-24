// this file contains method of picking up files and manipulatig  them

import 'dart:io';
import 'dart:typed_data';
import 'package:at_client_mobile/at_client_mobile.dart';


import 'package:file_picker/file_picker.dart';
import 'package:my_cert/utils/service.dart';
import 'package:at_commons/at_commons.dart';


class MyFileManager {

  Uint8List fileBytes;
  String fileName;

  getFile() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();
    //get the files from the picker
    if (result != null) {
      //fileBytes = result.files.first.bytes;
      File file = File(result.files.single.path);

      fileBytes = await file.readAsBytes();

      fileName = result.files.first.name;
      print(this.fileBytes);
      print(this.fileName);
      // Upload file
      //await FirebaseStorage.instance.ref('uploads/$fileName').putData(fileBytes);

      // store the values inthe keychain

      ServerDemoService _serverDemoService = ServerDemoService.getInstance();
      AtKey document = AtKey();
      //await _serverDemoService.get(document);
      document.key = this.fileName;
      document.sharedWith = "david";
      // store the files in the key value chain


      //await _serverDemoService.put(document, fileBytes.toString());
      // var atClientPreference = await _serverDemoService.getAtClientPreference();
      String atSign = await _serverDemoService.getAtSign();
      // await AtClientImpl.createClient(
      //     atSign, "my_cert", atClientPreference);
      // var atClient = await AtClientImpl.getClient(atSign);
      var streamResult =
      await _serverDemoService.sendFile(atSign, result.files.single.path);


      String value = await _serverDemoService.get(document);
      print(value);



    }
  }

  // saveFileToKeyChain(String atKey,data) async {
  //
  // }

}
