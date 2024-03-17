import 'dart:ui';

class Message {
  final String? message;
  final String id;
  //final Image? image;
  Message(this.message, this.id);

  factory Message.fromJson(jsonData) {
    return Message(
      jsonData['message'],
      jsonData['id'],
    );
  }
}
