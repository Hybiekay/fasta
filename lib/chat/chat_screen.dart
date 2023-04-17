import 'dart:developer';
import 'package:get/get.dart';
import 'ChatModel/message.dart';
import 'package:flutter/material.dart';
import 'package:ziklogistics/chat/chat_item.dart';
import 'package:ziklogistics/constants/app_color.dart';
import 'package:ziklogistics/chat/chat_controller.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

// ignore_for_file: public_member_api_docs, sort_constructors_first

class ChatScreen extends StatefulWidget {
  static const String routeName = '/chatScreen';
  final String receiverName;
  final String receiverEmail;
  final String senderName;
  final String senderEmail;
  final String token;

  const ChatScreen({
    Key? key,
    required this.receiverName,
    required this.receiverEmail,
    required this.senderName,
    required this.senderEmail,
    required this.token,
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ChatController chatController = ChatController();
  TextEditingController messageController = TextEditingController();
  late io.Socket socket;

  @override
  void initState() {
    log(widget.token);
    socket = io.io(
        'ws://e6c0-102-89-47-32.ngrok-free.app',
        io.OptionBuilder().setTransports(["websocket"]).setExtraHeaders(
            {'Authorization': 'Bearer ${widget.token}'}).build());
    _connectSocket();
    socket.connect();
    setUpSockecketListener();
    getMessage();
    super.initState();
  }

  _connectSocket() {
    log(widget.token);
    socket.onConnect((data) => log("Connected"));
    socket.onConnectError((data) => log("error in connection $data"));
    socket.onDisconnect((data) => log("Socket io is disconnected"));
  }

  sendMessage(String message) {
    socket.emit("sendMessage", {
      "message": message,
      "sender": widget.senderName,
      "room": "nn",
      "roomId": "dhdhf",
      "senderEmail": widget.senderEmail,
      "receiver": widget.receiverName,
      "receiverEmail": widget.receiverEmail
    });
  }

  setUpSockecketListener() {
    socket.on('recieveMessage', (data) {
      log(data.toString());
      if (data['payload']['receiverEmail'] == widget.receiverEmail) {
        chatController.chatMessages.add(Message.fromJson(data['data']));
      }
    });
  }

  getMessage() {
    socket.emitWithAck("getMessage", {
      "senderEmail": widget.senderEmail,
      "receiverEmail": widget.receiverEmail
    }, ack: (data) {
      log(data.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: false,
          titleSpacing: 0,
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.arrow_back_ios)),
          backgroundColor: AppColor.mainColor,
          title: Text(
            widget.receiverName,
          ),
          actions: const [
            Icon(Icons.search),
            Icon(Icons.more_vert),
          ]),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: AppColor.backgroundsecondary,
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: chatController.chatMessages.length,
                  itemBuilder: (context, index) {
                    var currentItem = chatController.chatMessages[index];
                    return SingleChat(
                      type: currentItem.messageType.toString(),
                      isMe: currentItem.isMe,
                      message: currentItem.message,
                    );
                  },
                );
              }),
            ),
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              color: AppColor.mainColor,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.add,
                        color: AppColor.whiteColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            color: AppColor.whiteColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            controller: messageController,
                            maxLines: 3,
                            minLines: 1,
                            decoration: const InputDecoration(
                                hintText: "Write your message",
                                border: InputBorder.none),
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GestureDetector(
                      onTap: () {
                        if (messageController.text.trim().isNotEmpty) {
                          sendMessage(messageController.text);
                        }
                      },
                      child: const Icon(
                        Icons.send_sharp,
                        color: AppColor.whiteColor,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
