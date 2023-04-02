// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ziklogistics/extensions/custom_extension.dart';

import '../../global_components/button_component.dart';
import '../../constants/appImages.dart';
import '../../constants/appocolor.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width.w,
          height: 200.h,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.chooseScreenImage),
                filterQuality: FilterQuality.high,
                fit: BoxFit.fitWidth),
          ),
        ).center,
        SizedBox(
          height: 120.98.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            'Hi, welcome onboard!',
            textAlign: TextAlign.center,
            style: GoogleFonts.dmSans(
              color: AppColor.whiteColor,
              fontSize: 30.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(
          height: 80.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: ButtonComp(onPressed: () {}, value: 'Sign up as a Customer'),
        ),
        SizedBox(
          height: 30.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: ButtonComp(onPressed: () {}, value: 'Sign up as a Dispatcher'),
        ),
      ],
    );
  }
}
