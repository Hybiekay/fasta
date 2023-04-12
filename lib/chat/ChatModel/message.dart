import 'chatEunm.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Message {
  final String message;
  final bool isMe;
  final MessageType messageType;
  Message(
      {required this.message, required this.isMe, required this.messageType});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'isMe': isMe,
      'messageType': messageType,
    };
  }

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      message: json['message'] as String,
      isMe: json['isMe'] as bool,
      messageType: json['messageTyp'],
    );
  }
}
