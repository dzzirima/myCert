import 'dart:typed_data';

class Document {
  String title;
  Uint8List fileBytes;
  String description;


  @override
  String toString() => '${title},${description}';
}