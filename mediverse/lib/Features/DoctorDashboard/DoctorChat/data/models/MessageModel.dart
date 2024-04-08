import 'dart:ui';

class Message {
  final String message;
  final String id;
  final String? imageUrl;

  //final Image? image;
  Message(this.message, this.id, this.imageUrl);

  factory Message.fromJson(jsonData) {
    return Message(
      jsonData['message'],
      jsonData['id'],
      jsonData['imageUrl'] ?? '',
    );
  }
}
