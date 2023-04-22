import 'dart:developer';
import 'package:get/get.dart';
import '../drawer/drawer.dart';
import 'package:flutter/material.dart';
import '../../constants/app_color.dart';
import '../../constants/app_images.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../global_components/button_component.dart';
import 'package:ziklogistics/models/customers_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ziklogistics/notification/notification.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:ziklogistics/views/send_package_1/send_package_1.dart';

class CostomerHomeBody extends StatefulWidget {
  const CostomerHomeBody({super.key});

  @override
  State<CostomerHomeBody> createState() => _CostomerHomeBodyState();
}

class _CostomerHomeBodyState extends State<CostomerHomeBody> {
  late io.Socket socket;

  @override
  void initState() {
    // chatController.fetchMessages();
    log("this is Costomer Email${CustomersUserModel.email}");
    log(CustomersModel.token!);
    socket = io.io(
        'https://test-ki3c.onrender.com',
        io.OptionBuilder().setTransports(["websocket"]).setExtraHeaders(
            {'Authorization': 'Bearer ${CustomersModel.token}'}).build());

    socket.connect();
    _connectSocket();
    receiveMessages();
    super.initState();
  }

  receiveMessages() {
    log('receiveMessage');
    socket.on('receiveMessage', (data) {
      log('receiveMessage');

      if (data['payload']["receiverEmail"] == CustomersUserModel.email) {
        log("adding Message");
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
    log(CustomersModel.token!);
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
          height: 328.h,
          color: AppColor.whiteColor,
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => const DrawerScreen());
                    // Navigator.of(context).pushNamed(DrawerScreen.routeName);
                  },
                  child: Image.asset(
                    AppImages.menuBar,
                    filterQuality: FilterQuality.high,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  'Send packages with Ziklogistics',
                  style: GoogleFonts.dmSans(
                    color: AppColor.mainColor,
                    fontSize: 35.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 30.h,
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
          )),
        ),
        Expanded(
            child: Container(
          width: MediaQuery.of(context).size.width.w,
          color: AppColor.mainColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.homePageImage,
                width: 300.w,
                height: 158.h,
                filterQuality: FilterQuality.high,
              ),
              SizedBox(
                height: 50.h,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                child: ButtonComp(
                    onPressed: () {
                      Navigator.of(context).pushNamed(SendPackage1.routeName);
                    },
                    value: 'Send A Package'),
              )
            ],
          ),
        ))
      ],
    );
  }
}
