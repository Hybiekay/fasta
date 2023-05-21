import 'package:flutter/material.dart';
import 'package:ziklogistics/components/Widget/Slider.dart';

import 'package:ziklogistics/constants/app_color.dart';
import 'package:ziklogistics/constants/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

class OnboardingScreen3 extends StatelessWidget {
  final bool isDriver;
  const OnboardingScreen3({super.key, this.isDriver = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(color: AppColor.mainColor),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),
                  SizedBox(
                    width: 250,
                    height: MediaQuery.of(context).size.height * 0.38,
                    child: Image.asset(AppImages.onboardScreenImage3,
                        fit: BoxFit.fitWidth),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.45,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Center(
                              child: Text(
                                isDriver
                                    ? "Update Ongoing Process"
                                    : 'Track Your Delivery',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColor.whiteColor,
                                    fontFamily: 'DMSans',
                                    fontSize: 28,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w700,
                                    height: 1.5),
                              ),
                            ),
                            Text(
                              isDriver
                                  ? " Update your ongoing process by selecting the ongoing progress for any ongoing package. "
                                  : 'Track your delivery by viewing the ongoing progress for your package. ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColor.whiteColor,
                                  fontFamily: 'DMSans',
                                  fontSize: 20,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                  height: 1.5),
                            ),
                            SliderWidget(
                              position: 60,
                            ),
                          ])),
                ])),
      ),
    );
  }
}
