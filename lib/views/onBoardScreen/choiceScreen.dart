import 'dart:convert';
import 'package:get/get.dart';
import '../../models/models.dart';
import 'package:flutter/material.dart';
import '../../controllers/controllers.dart';
import 'package:ziklogistics/views/home/home.dart';
import 'package:ziklogistics/constants/appImages.dart';
import 'package:ziklogistics/constants/appocolor.dart';
import 'package:ziklogistics/views/auth/login_Screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ziklogistics/Dispatcher/views/DispatcherHome/home.dart';
import 'package:ziklogistics/components/Widget/OnBoadPageSelection.dart';
import 'package:ziklogistics/Dispatcher/views/Dispatcherauth/login_Screen.dart';
// ignore_for_file: file_names

class ChoiceScreen extends StatelessWidget {
  static const String routeName = '/ChioceScreen';
  const ChoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: AppColor.mainColor,
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: Image.asset(
                    AppImages.chooseScreenImage,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                const Center(
                  child: Text(
                    'Hi, welcome onboard!',
                    style: TextStyle(
                      color: AppColor.whiteColor,
                      fontFamily: 'DM Sans',
                      fontSize: 30,
                      letterSpacing: 0,
                      fontWeight: FontWeight.bold,
                      height: 1.1,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 40.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.whiteColor,
                    ),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.whiteColor),
                        onPressed: () async {
                          Get.to(() => const LoginScreen());
                          final data = await Storage.getData();
                          custormerName = json.decode(data);
                          print(CustomersUserModel.name);
                          if (CustomersUserModel.name == null &&
                              CustomersModel.token == null) {
                            Get.to(() => const OnBoardPages());
                          }
                          if (CustomersModel.token == null &&
                              CustomersUserModel.name != null) {
                            Get.to(() => const LoginScreen());
                          } else {
                            Get.to(() => const CostomerHome());
                          }
                        },
                        child: const Text(
                          'Sign up as a Customer',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColor.mainColor,
                              fontFamily: 'DMSans',
                              fontSize: 20,
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                              height: 1.5),
                        )),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 40.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.whiteColor,
                    ),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.whiteColor),
                        onPressed: () async {
                          Get.to(() => const DispatcherLoginScreen());

                          final data = await DStorage.getDriverData();
                          print("this is   $data");
                          driverData = json.decode(data);
                          print("this is   $data");
                          // if (DriverUserModel.name == null) {
                          //   print("DriverUserModel.name is null login in");
                          //   Get.to(() => const DispatcherOnBoardPages());
                          // } else if (DriverUserModel.name != null &&
                          //     DriverUserModel.nin != null &&
                          //     DriverModel().token == null) {
                          //   print("DriverUserModel. is null login in");

                          //   Get.to(() => const DispatcherLoginScreen());
                          // } else {
                          //   Get.to(() => const DispatcherHome());
                          // }
                        },
                        child: const Text(
                          'Sign up as a Dispatcher',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColor.mainColor,
                              fontFamily: 'DMSans',
                              fontSize: 18,
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                              height: 1.5),
                        )),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
              ])),
    );
  }
}
