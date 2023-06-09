import 'package:ziklogistics/Dispatcher/views/DispatcherH/Swicht.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ziklogistics/constants/app_color.dart';
import 'package:ziklogistics/global_components/headerbar.dart';
import 'package:ziklogistics/Dispatcher/views/DispatcherHome/home.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class DispatcherDeliveryhistory extends StatelessWidget {
  static const String routeName = '/dispatcherdeliveryhistory';
  const DispatcherDeliveryhistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: AppColor.mainColor,
          child: Column(children: [
            HeaderWidget(
              subTitle: 'Delivery History',
              onPressed: () {
                Get.offAll(() => const DispatcherHome());
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            const DispatcherongoingComleteSwicth(),
          ]),
        ),
      ),
    );
  }
}
