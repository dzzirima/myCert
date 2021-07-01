import 'dart:typed_data';

class Document {
  final String title;
  final Uint8List fileBytes;
  String description;

  Document(this.title,this.fileBytes);
}