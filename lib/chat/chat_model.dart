class ChatMessage {
  String message;
  String sender;
  String room;
  String roomId;
  String senderEmail;
  String receiver;
  String receiverEmail;
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  String messageID;

  ChatMessage({
    required this.message,
    required this.sender,
    required this.room,
    required this.roomId,
    required this.senderEmail,
    required this.receiver,
    required this.receiverEmail,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.messageID,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      message: json['payload']['message'],
      sender: json['payload']['sender'],
      room: json['payload']['room'],
      roomId: json['payload']['roomId'],
      senderEmail: json['payload']['senderEmail'],
      receiver: json['payload']['receiver'],
      receiverEmail: json['payload']['receiverEmail'],
      id: json['data']['id'],
      createdAt: DateTime.parse(json['data']['createdAt']),
      updatedAt: DateTime.parse(json['data']['updatedAt']),
      messageID: json['data']['messageID'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'payload': {
        'message': message,
        'sender': sender,
        'room': room,
        'roomId': roomId,
        'senderEmail': senderEmail,
        'receiver': receiver,
        'receiverEmail': receiverEmail,
      },
      'data': {
        'id': id,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
        'message': message,
        'sender': sender,
        'receiver': receiver,
        'senderEmail': senderEmail,
        'receiverEmail': receiverEmail,
        'messageID': messageID,
      },
    };
  }
}
