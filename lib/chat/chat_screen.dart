import 'dart:developer';
import 'package:get/get.dart';
import 'ChatModel/message.dart';
import 'package:ziklogistics/chat/chat_item.dart';
import 'package:ziklogistics/chat/chat_controller.dart';
import 'package:ziklogistics/notification/notification.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:ziklogistics/global_components/ziklogistics.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class ChatScreen extends StatefulWidget {
  static const String routeName = '/chatScreen';
  final String receiverName;
  final String receiverEmail;
  final String senderName;
  final String senderEmail;
  final String packageId;
  final String token;
  final String email;

  const ChatScreen(
      {Key? key,
      required this.packageId,
      required this.receiverName,
      required this.receiverEmail,
      required this.senderName,
      required this.senderEmail,
      required this.token,
      required this.email})
      : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ChatController chatController = ChatController();
  final ScrollController _scrollController =
      ScrollController(keepScrollOffset: true);
  TextEditingController _messageController = TextEditingController();
  late io.Socket socket;

  @override
  @override
  void initState() {
    // chatController.fetchMessages();
    log("this is driver Email${widget.senderEmail}");
    log(widget.token);
    socket = io.io(
        'https://test-ki3c.onrender.com',
        io.OptionBuilder().setTransports(["websocket"]).setExtraHeaders(
            {'Authorization': 'Bearer ${widget.token}'}).build());
    _connectSocket();
    socket.connect();
    getMessage();
    receiveMessages();

    super.initState();
  }

  _connectSocket() {
    log(widget.token);
    socket.onConnect((data) => log("Connected"));
    socket.onConnectError((data) => log("error in connection $data"));
    socket.onDisconnect((data) => log("Socket io is disconnected"));
  }

  scrollToEnd() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  sendMessage(String message) {
    log('send message');
    socket.emit("sendMessage", {
      "packageId": widget.packageId,
      "message": message,
      "sender": widget.senderName,
      "room": "nn",
      "roomId": "dhdhf",
      "senderEmail": widget.senderEmail,
      "receiver": widget.receiverName,
      "receiverEmail": widget.receiverEmail
    });
  }

  receiveMessages() {
    log('receiveMessage');
    socket.on('receiveMessage', (data) {
      log('receiveMessage');
      log(widget.email);
      log(widget.senderEmail);
      log(widget.receiverEmail.toString());
      if (data['payload']["receiverEmail"] == widget.senderEmail) {
        log("adding Message");
        Message message = Message(
          id: "uju",
          createdAt: DateTime.parse(data["data"]["createdAt"]),
          updatedAt: DateTime.parse(data["data"]["updatedAt"]),
          message: data['payload']["message"],
          sender: data['payload']["sender"],
          receiver: data['payload']["receiver"],
          senderEmail: data['payload']["senderEmail"],
          receiverEmail: data['payload']["receiverEmail"],
          messageID: data["data"]["messageID"],
        );
        Notify.sendNotice(
            title: "${data['payload']["receiver"]}",
            body: "${data['payload']["message"]}");
        chatController.addMessage(message);
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeOut,
        );
      }
    });
  }

  getMessage() {
    log("GetMEssage");
    log("this is driver Email ${widget.senderEmail}, ${widget.packageId}");
    socket.emitWithAck("getMessage", {
      "packageId": widget.packageId,
    }, ack: (data) {
      for (var element in data) {
        chatController.addMessage(Message.fromJson(element));
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeOut,
        );
      }

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
                  shrinkWrap: true,
                  controller: _scrollController,
                  itemCount: chatController.chatMessages.length + 1,
                  itemBuilder: (context, index) {
                    if (index == chatController.chatMessages.length) {
                      return Container(
                        height: 70,
                      );
                    }
                    var currentItem = chatController.chatMessages[index];
                    return SingleChat(
                      time: currentItem.createdAt,
                      isMe: currentItem.senderEmail == widget.senderEmail,
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
                            controller: _messageController,
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
                        if (_messageController.text.trim().isNotEmpty) {
                          sendMessage(_messageController.text);
                          Message message = Message(
                              id: "",
                              createdAt: DateTime.now(),
                              updatedAt: DateTime.now(),
                              message: _messageController.text,
                              sender: widget.senderName,
                              receiver: widget.receiverName,
                              senderEmail: widget.senderEmail,
                              receiverEmail: widget.receiverName,
                              messageID: "");
                          chatController.addMessage(message);
                          _messageController.clear();
                          _scrollController.animateTo(
                            _scrollController.position.maxScrollExtent,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeOut,
                          );
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
