import 'package:get/get.dart';
import 'ChatModel/message.dart';
import 'package:flutter/material.dart';
import 'package:ziklogistics/chat/chat_item.dart';
import 'package:ziklogistics/constants/app_color.dart';
import 'package:ziklogistics/chat/chat_controller.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

// ignore_for_file: public_member_api_docs, sort_constructors_first

class ChatScreen extends StatefulWidget {
  static const String routeName = '/chatScreen';
  final String uid;
  final String userName;
  final String friendName;

  const ChatScreen({
    Key? key,
    required this.uid,
    required this.userName,
    required this.friendName,
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ChatController chatController = ChatController();
  TextEditingController messageController = TextEditingController();
  late IO.Socket socket;

  @override
  void initState() {
    socket = IO.io(
        'http://localhost:3000',
        IO.OptionBuilder()
            .setTransports(["websocket"])
            .setQuery({})
            .disableAutoConnect()
            .build());
    _connectSocket();
    socket.connect();
    super.initState();
  }

  _connectSocket() {
    socket.onConnect((data) => print("Connected"));
    socket.onConnectError((data) => print("error in connection $data"));
    socket.onDisconnect((data) => print("Socket io is disconnected"));
    socket.on('message', (_) => print(_));
  }

  sendMessage() {
    socket.emit("message",
        {"message": messageController.text.trim(), "senderId": widget.uid});
  }

  setUpSockecketListener() {
    socket.on('message', (data) {
      chatController.chatMessages.add(Message.fromJson(data));
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
            widget.friendName,
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
                          sendMessage();
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
