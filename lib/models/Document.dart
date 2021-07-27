
import 'dart:typed_data';

class Document {
  late String title;
  late String fileBytesString;
  late String description;
  late int fileSize;
  late List<Map<String,String>> sharedWith;

  @override
  String toString() => 'Title:$title,SharedWith:$sharedWith,size :$fileSize,description:$description ,fileBytesString$fileBytesString';
}