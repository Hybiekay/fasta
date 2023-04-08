import 'dart:convert';
import 'package:flutter/material.dart';
import '../../models/customers_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ziklogistics/chat/chat_screen.dart';
import 'package:ziklogistics/constants/app_color.dart';
import 'package:ziklogistics/controllers/controllers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ziklogistics/global_components/headerbar.dart';
import 'package:ziklogistics/views/paymentScreens/card_choise.dart';
import 'package:ziklogistics/global_components/button_component.dart';

class ChoicePayment extends StatelessWidget {
  static const String routeName = '/choicePayment';
  final String distants;
  final String amount;
  final String time;
  final String packageId;
  const ChoicePayment(
      {super.key,
      required this.packageId,
      required this.distants,
      required this.amount,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: AppColor.mainColor,
        child: Column(
          children: [
            HeaderWidget(subTitle: "Payment"),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Select your paymet option',
                style: GoogleFonts.dmSans(
                  color: AppColor.whiteColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            ButtonComp(
                onPressed: () async {
                  final data = await Storage.getData();
                  custormerName = json.decode(data);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CardChoice(
                            distants: distants,
                            amount: amount,
                            time: time,
                            userName: CustomersUserModel.name!,
                            email: CustomersUserModel.email!,
                            packageId: packageId),
                      ));
                },
                value: "Pay with Card "),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            ButtonComp(
                onPressed: () {
                  Navigator.of(context).pushNamed(ChatScreen.routeName);
                },
                value: "Pay on Delivery (Cash)"),
          ],
        ),
      ),
    );
  }
}
