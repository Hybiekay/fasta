import 'dart:developer';
import 'request_card.dart';
import 'package:get/get.dart';
import '../../../controllers/controllers.dart';
import 'package:ziklogistics/models/models.dart';
import 'package:ziklogistics/chat/ChatModel/message.dart';
import 'package:ziklogistics/notification/notification.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:ziklogistics/global_components/ziklogistics.dart';
import 'package:ziklogistics/Dispatcher/views/Dispatcherdrawer/drawer.dart';
import 'package:ziklogistics/Dispatcher/views/DispatcherHome/home_preview.dart';

class DispatcherHomeBody extends StatefulWidget {
  const DispatcherHomeBody({super.key});

  @override
  State<DispatcherHomeBody> createState() => _DispatcherHomeBodyState();
}

class _DispatcherHomeBodyState extends State<DispatcherHomeBody> {
  DriverController driverController = Get.put(DriverController());

  late io.Socket socket;
  String token = '';

  @override
  void initState() {
    gettoken();
    // chatController.fetchMessages();
    log("this is driver Email${DriverUserModel.email ?? token}");
    log(DriverModel.token!);
    socket = io.io(
        'https://test-ki3c.onrender.com',
        io.OptionBuilder().setTransports(["websocket"]).setExtraHeaders(
            {'Authorization': 'Bearer ${DriverModel.token ?? token}'}).build());

    socket.connect();
    receiveMessages();
    _connectSocket();

    super.initState();
  }

  gettoken() async {
    token = await DStorage.getDriverToken();
    setState(() {});
  }

  receiveMessages() {
    log('receiveMessage');
    socket.on('receiveMessage', (data) {
      log('receiveMessage');

      if (data['payload']["receiverEmail"] == CustomersUserModel.email) {
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
        // chatController.addMessage(message);
        //     _scrollController.animateTo(
        //       _scrollController.position.maxScrollExtent,
        //       duration: Duration(milliseconds: 500),
        //       curve: Curves.easeOut,
        //     );
        //   }
        // });
      }
    });
  }

  _connectSocket() {
    log("");
    socket.onConnect((data) => log("Connected"));
    socket.onConnectError((data) => log("error in connection $data"));
    socket.onDisconnect((data) => log("Socket io is disconnected"));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width.w,
          height: MediaQuery.of(context).size.height * 0.32,
          color: AppColor.whiteColor,
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const DispatcherDrawerScreen());
                    },
                    child: Image.asset(
                      AppImages.menuBar,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Your Dispatch Request',
                    style: GoogleFonts.dmSans(
                      color: AppColor.mainColor,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    'Get it delivered in the time it takes to drive there!',
                    style: GoogleFonts.dmSans(
                      color: AppColor.mainColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          )),
        ),
        Expanded(
            child: Container(
          height: MediaQuery.of(context).size.height * 0.68.h,
          color: AppColor.mainColor,
          child: StreamBuilder<List<dynamic>>(
              stream: driverController.getAllRequest(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData && snapshot.data.length < 1) {
                  return const NodataCard(content: "You have No Request \nyet");
                } else if (snapshot.hasData && snapshot.data.length >= 1) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      List<dynamic> dataList = snapshot.data;

                      dataList.sort((a, b) {
                        DateTime timeA = DateTime.parse(a['createdAt']);
                        DateTime timeB = DateTime.parse(b['createdAt']);
                        return timeB.compareTo(timeA);
                      });

                      final item = dataList[index];
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => PrivewHome(
                                name: item["name"].toString(),
                                price: item["price"].toString(),
                                time: item["duration"].toString(),
                                distance: item["distance"].toString(),
                                size: item["size"].toString(),
                                withe: item["width"].toString(),
                                pickUp: item["pickup_address"],
                                dropOff: item["dropoff_address"],
                                isScahedule: item["isScheduled"],
                                scheduleTime:
                                    "${item["scheduled_date"]} ${item["scheduled_time"]}",
                                packageId: item["id"],
                              ));
                        },
                        child: RequestCard(
                          name: item["name"],
                          price: item["price"],
                          time: item["duration"],
                          distance: item["distance"],
                          isScheduled: item["isScheduled"],
                          datetime:
                              "${item["scheduled_date"]} ${item["scheduled_time"]}",
                        ),
                      );
                    },
                  );
                }
                return const NodataCard(content: "You have No Request \nyet");
              }),
        ))
      ],
    );
  }
}
