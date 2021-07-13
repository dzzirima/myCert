
import 'dart:typed_data';

class Document {
  String title;
  Uint8List fileBytes;
  String description;
  List<Map<String,String>> sharedWith;

  @override
  String toString() => '${title},${description},${sharedWith}';
}