import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ziklogistics/constants/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore_for_file: sort_child_properties_last, prefer_const_constructors, must_be_immutable


class ButtonComp extends StatelessWidget {
  String value;
  VoidCallback onPressed;
  ButtonComp({super.key, required this.onPressed, required this.value});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 45.h,
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: Text(
            value,
            style: GoogleFonts.dmSans(
              color: AppColor.mainColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
