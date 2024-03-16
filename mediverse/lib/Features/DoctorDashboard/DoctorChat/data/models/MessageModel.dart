import 'dart:ui';

class Message {
  final String message;
  final String id;
  final Image? image;
  Message(this.message, this.id, this.image);

  factory Message.fromJson(jsonData) {
    return Message(jsonData['TextMessage'], jsonData['id'], jsonData['image']);
  }
}
