import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ziklogistics/constants/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class InputPackagedetails extends StatelessWidget {
  String img1;
  String desc1;
  String textField1;
  String textField3;
  String textField4;
  String img2;
  String desc2;
  String textField2;
  bool isSize;
  TextEditingController val1;
  TextEditingController val2;
  TextEditingController val3;

  TextEditingController val4;
  VoidCallback onPressed;
  InputPackagedetails({
    Key? key,
    required this.onPressed,
    required this.isSize,
    required this.img1,
    required this.desc1,
    required this.textField1,
    required this.textField3,
    required this.textField4,
    required this.img2,
    required this.desc2,
    required this.textField2,
    required this.val1,
    required this.val2,
    required this.val3,
    required this.val4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
          padding: EdgeInsets.only(top: 10.h, left: 20, right: 30, bottom: 10),
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
                    Row(
                      children: [
                        SizedBox(
                          width: isSize ? 100.w : 200.w,
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
                        isSize
                            ? Row(
                                children: [
                                  Container(
                                    width: 2,
                                    height: 25,
                                    color: AppColor.mainColor,
                                  ),
                                  SizedBox(
                                    height: 10.w,
                                  ),
                                  SizedBox(
                                    width: 100.w,
                                    child: TextFormField(
                                        controller: val2,
                                        expands: false,
                                        textAlign: TextAlign.justify,
                                        decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10),
                                            hintText: textField2,
                                            hintStyle: TextStyle(
                                                fontFamily:
                                                    'CerebriSansPro-Regular',
                                                color: AppColor.mainColor,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w400),
                                            focusColor: AppColor.mainColor,
                                            border: InputBorder.none)),
                                  ),
                                ],
                              )
                            : Container(),
                      ],
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
                    Row(
                      children: [
                        SizedBox(
                          width: isSize ? 100.w : 200.w,
                          child: TextFormField(
                            
                              controller: val3,
                              expands: false,
                              onEditingComplete: onPressed,
                              textAlign: TextAlign.justify,
                              decoration: InputDecoration(
                                  hintText: textField3,
                                  hintStyle: TextStyle(
                                      fontFamily: 'CerebriSansPro-Regular',
                                      color: AppColor.mainColor,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400),
                                  focusColor: AppColor.mainColor,
                                  border: InputBorder.none)),
                        ),
                        isSize
                            ? Row(
                                children: [
                                  Container(
                                    width: 2,
                                    height: 25,
                                    color: AppColor.mainColor,
                                  ),
                                  SizedBox(
                                    width: 100.w,
                                    child: TextFormField(
                                        controller: val4,
                                        expands: false,
                                        textAlign: TextAlign.justify,
                                        decoration: InputDecoration(
                                            hintText: textField4,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10),
                                            hintStyle: TextStyle(
                                                fontFamily:
                                                    'CerebriSansPro-Regular',
                                                color: AppColor.mainColor,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w400),
                                            focusColor: AppColor.mainColor,
                                            border: InputBorder.none)),
                                  ),
                                ],
                              )
                            : Container()
                      ],
                    ),
                  ],
                )
              ])
            ],
          )),
    );
  }
}
