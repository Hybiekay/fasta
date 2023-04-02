import '../constants/appocolor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ziklogistics/constants/appImages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class TotalItemBar extends StatelessWidget {
  final String distants, amount, time;
  const TotalItemBar(
      {super.key,
      required this.amount,
      required this.distants,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Image.asset(
                AppImages.pickUpVan,
                filterQuality: FilterQuality.high,
                width: 33.w,
                height: 33.h,
              ),
              SizedBox(
                width: 15.w,
              ),
              Column(
                children: [
                  Text(
                    "Distance",
                    style: GoogleFonts.dmSans(
                      color: AppColor.mainColor,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 9.h,
                  ),
                  Text(
                    "$distants km",
                    style: GoogleFonts.dmSans(
                      color: AppColor.mainColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 30.w,
              ),
              Column(
                children: [
                  Text(
                    "Time",
                    style: GoogleFonts.dmSans(
                      color: AppColor.mainColor,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 9.h,
                  ),
                  Text(
                    "$time Min",
                    style: GoogleFonts.dmSans(
                      color: AppColor.mainColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 30.w,
              ),
              Column(
                children: [
                  Text(
                    "Price",
                    style: GoogleFonts.dmSans(
                      color: AppColor.mainColor,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 9.h,
                  ),
                  Text(
                    "₦ $amount",
                    overflow: TextOverflow.fade,
                    style: GoogleFonts.dmSans(
                      color: AppColor.mainColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
