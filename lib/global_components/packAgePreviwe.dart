import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ziklogistics/constants/appImages.dart';
import 'package:ziklogistics/constants/appocolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


class PackagedetailsSize extends StatelessWidget {
  const PackagedetailsSize({
    super.key,
  });

  

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 160,
        child: Padding(
            padding: EdgeInsets.only(top: 10.h, left: 20, right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(children: [
                  Image.asset(AppImages.packageImg,
                      width: 20.w, height: 19.99.h),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Approx. Size',
                        style: GoogleFonts.dmSans(
                          color: AppColor.mainColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                          width: 100.w,
                          child: Text(
                            " ???",
                            style: TextStyle(
                                fontFamily: 'CerebriSansPro-Regular',
                                color: AppColor.mainColor,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400),
                          )),
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
                    AppImages.packageImg,
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
                        'Approx. Weight',
                        style: GoogleFonts.dmSans(
                          color: AppColor.mainColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          width: 100.w,
                          child: Text(
                            " ???",
                            style: TextStyle(
                                fontFamily: 'CerebriSansPro-Regular',
                                color: AppColor.mainColor,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )
                ])
              ],
            )),
      ),
    );
  }
}

class Packagedetailslocation extends StatelessWidget {
  const Packagedetailslocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: SizedBox(
        height: 160,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Padding(
            padding: EdgeInsets.only(top: 10.h, left: 20, right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(children: [
                  Image.asset(AppImages.pickUp, width: 20.w, height: 19.99.h),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Pickup',
                        style: GoogleFonts.dmSans(
                          color: AppColor.mainColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                          width: 100.w,
                          child: Text(
                            " ???",
                            style: TextStyle(
                                fontFamily: 'CerebriSansPro-Regular',
                                color: AppColor.mainColor,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400),
                          )),
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
                    AppImages.locatnImg,
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
                        'Drop-Off',
                        style: GoogleFonts.dmSans(
                          color: AppColor.mainColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          width: 100.w,
                          child: Text(
                            " ???",
                            style: TextStyle(
                                fontFamily: 'CerebriSansPro-Regular',
                                color: AppColor.mainColor,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )
                ])
              ],
            )),
      ),
    );
  }
}
