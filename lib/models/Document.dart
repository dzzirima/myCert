
import 'dart:typed_data';

class Document {
  String title;
  String fileBytesString;
  String description;
  int fileSize;
  List<Map<String,String>> sharedWith;

  @override
  String toString() => 'Title:$title,SharedWith:$sharedWith,size :$fileSize,$description ,$fileBytesString';
}