// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ziklogistics/constants/appocolor.dart';

class InputPackagedetails extends StatelessWidget {
  String img1;
  String desc1;
  String textField1;
  String img2;
  String desc2;
  String textField2;
  TextEditingController val1;
  TextEditingController val2;
  InputPackagedetails(
      {super.key,
      required this.desc1,
      required this.img1,
      required this.textField1,
      required this.desc2,
      required this.img2,
      required this.textField2,
      required this.val1,
      required this.val2});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
          padding: EdgeInsets.only(top: 10.h, left: 20, right: 30),
          child: Column(
            children: [
              Row(children: [
                Image.asset(img1, width: 20.w, height: 19.99.h),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      desc1,
                      style: GoogleFonts.dmSans(
                        color: AppColor.mainColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 100.w,
                      child: TextFormField(
                          controller: val1,
                          expands: false,
                          textAlign: TextAlign.justify,
                          decoration: InputDecoration(
                              hintText: textField1,
                              hintStyle: TextStyle(
                                  fontFamily: 'CerebriSansPro-Regular',
                                  color: AppColor.mainColor,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400),
                              focusColor: AppColor.mainColor,
                              border: InputBorder.none)),
                    ),
                  ],
                )
              ]),
              Divider(
                color: AppColor.mainColor,
                thickness: 3.0,
                indent: 40,
              ),
              Row(children: [
                Image.asset(
                  img2,
                  width: 20.w,
                  height: 19.99.h,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      desc2,
                      style: GoogleFonts.dmSans(
                        color: AppColor.mainColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 100.w,
                      child: TextFormField(
                          controller: val2,
                          expands: false,
                          textAlign: TextAlign.justify,
                          decoration: InputDecoration(
                              hintText: textField2,
                              hintStyle: TextStyle(
                                  fontFamily: 'CerebriSansPro-Regular',
                                  color: AppColor.mainColor,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400),
                              focusColor: AppColor.mainColor,
                              border: InputBorder.none)),
                    ),
                  ],
                )
              ])
            ],
          )),
    );
  }
}
