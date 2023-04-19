class Message {
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  String message;
  String sender;
  String receiver;
  String senderEmail;
  String receiverEmail;
  String messageID;

  Message({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.message,
    required this.sender,
    required this.receiver,
    required this.senderEmail,
    required this.receiverEmail,
    required this.messageID,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      message: json['message'],
      sender: json['sender'],
      receiver: json['receiver'],
      senderEmail: json['senderEmail'],
      receiverEmail: json['receiverEmail'],
      messageID: json['messageID'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'message': message,
      'sender': sender,
      'receiver': receiver,
      'senderEmail': senderEmail,
      'receiverEmail': receiverEmail,
      'messageID': messageID,
    };
  }
}
