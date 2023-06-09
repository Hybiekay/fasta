import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ziklogistics/views/auth/login_Screen.dart';
import '../../constants/app_color.dart';
import '../../constants/app_images.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ziklogistics/views/drawer/btn_comp.dart';
import 'package:ziklogistics/models/customers_model.dart';
import 'package:ziklogistics/controllers/controllers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ziklogistics/views/onBoardScreen/choiceScreen.dart';
import 'package:ziklogistics/views/DeliveryH/delivery_history.dart';

// ignore_for_file: prefer_const_literals_to_create_immutables

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String? name;
  @override
  void initState() {
    getName();
    super.initState();
  }

  getName() async {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width.w,
          height: 320.h,
          color: AppColor.whiteColor,
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    AppImages.close,
                    filterQuality: FilterQuality.high,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  children: [
                    Text(
                      CustomersUserModel.name ?? name ?? "Login Again",
                      style: GoogleFonts.dmSans(
                        color: AppColor.mainColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 63,
                      height: 63,
                      decoration: BoxDecoration(
                          color: AppColor.mainColor,
                          borderRadius: BorderRadius.circular(50)),
                    )
                  ],
                ),
                SizedBox(
                  height: 35.h,
                ),
                BtnComp(onPressed: () {
                  Get.off(
                    () => const Deliveryhistory(),
                  );
                })
              ],
            ),
          )),
        ),
        Expanded(
            child: Container(
          padding: const EdgeInsets.symmetric(vertical: 31, horizontal: 29),
          width: MediaQuery.of(context).size.width.w,
          color: AppColor.mainColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Image.asset(
                  AppImages.referAFriendImg,
                  width: 20.w,
                  height: 20.h,
                ),
                title: Text(
                  'Refer a friend',
                  style: GoogleFonts.dmSans(
                    color: AppColor.whiteColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              // SizedBox(
              //   height: 30.h,
              // ),
              ListTile(
                leading: Image.asset(
                  AppImages.referAFriendImg,
                  width: 20.w,
                  height: 20.h,
                ),
                title: Text(
                  'Contact',
                  style: GoogleFonts.dmSans(
                    color: AppColor.whiteColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              ListTile(
                onTap: () async {
                  await Storage.CustomerlogOut();
                  Get.offAll(() => const LoginScreen());
                },
                leading: Image.asset(
                  AppImages.referAFriendImg,
                  width: 20.w,
                  height: 20.h,
                ),
                title: Text(
                  'Log Out',
                  style: GoogleFonts.dmSans(
                    color: AppColor.whiteColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              ListTile(
                onTap: () async {
                  await DStorage.logALLOut();
                  Get.offAll(() => const ChoiceScreen());
                },
                leading: Image.asset(
                  AppImages.referAFriendImg,
                  width: 20.w,
                  height: 20.h,
                ),
                title: Text(
                  'Log Out And Login As Dispatcher',
                  style: GoogleFonts.dmSans(
                    color: AppColor.whiteColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                'V1.1',
                style: GoogleFonts.dmSans(
                  color: AppColor.mainSecondryColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ))
      ],
    );
  }
}
