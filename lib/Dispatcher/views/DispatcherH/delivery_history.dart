import 'swicht.dart';
import 'package:flutter/material.dart';
import 'package:ziklogistics/constants/app_color.dart';
import 'package:ziklogistics/global_components/headerbar.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first



class DispatcherDeliveryhistory extends StatelessWidget {
  static const String routeName = '/dispatcherdeliveryhistory';
  const DispatcherDeliveryhistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: AppColor.mainColor,
        child: Column(children: [
          HeaderWidget(subTitle: 'Delivery History'),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          const DispatcherongoingComleteSwicth(),
        ]),
      ),
    );
  }
}
