// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ziklogistics/constants/appImages.dart';
import 'package:ziklogistics/constants/appocolor.dart';

class DisBtnComp extends StatelessWidget {
  VoidCallback onPressed;
  DisBtnComp({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 80.h,
        decoration: BoxDecoration(
          color: AppColor.mainColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.timeImage,
              filterQuality: FilterQuality.high,
              width: 25.w,
              height: 25.h,
            ),
            SizedBox(
              width: 35.w,
            ),
            Text(
              'Dispatcher History',
              style: GoogleFonts.dmSans(
                color: AppColor.whiteColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
