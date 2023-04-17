import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ziklogistics/constants/app_color.dart';
import 'package:ziklogistics/constants/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

class PackagedetailsSize extends StatelessWidget {
  final String val1;
  final String val2;
  final String val3;
  final String val4;
  const PackagedetailsSize({
    Key? key,
    required this.val1,
    required this.val2,
    required this.val3,
    required this.val4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 160.h,
        child: Padding(
            padding: EdgeInsets.only(top: 10.h, left: 20, right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(children: [
                  Image.asset(AppImages.packageImg,
                      width: 20.w, height: 19.99.h),
                  const SizedBox(
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
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          SizedBox(
                              width: 100.w,
                              child: Text(
                                val1,
                                style: TextStyle(
                                    fontFamily: 'CerebriSansPro-Regular',
                                    color: AppColor.mainColor,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400),
                              )),
                          SizedBox(
                              width: 100.w,
                              child: Text(
                                val2,
                                style: TextStyle(
                                    fontFamily: 'CerebriSansPro-Regular',
                                    color: AppColor.mainColor,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400),
                              )),
                        ],
                      ),
                    ],
                  )
                ]),
                const Divider(
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
                  const SizedBox(
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
                      Row(
                        children: [
                          SizedBox(
                              width: 100.w,
                              child: Text(
                                val2,
                                style: TextStyle(
                                    fontFamily: 'CerebriSansPro-Regular',
                                    color: AppColor.mainColor,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400),
                              )),
                          SizedBox(
                              width: 100.w,
                              child: Text(
                                val4,
                                style: TextStyle(
                                    fontFamily: 'CerebriSansPro-Regular',
                                    color: AppColor.mainColor,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400),
                              )),
                        ],
                      ),
                      const SizedBox(
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
  final String val1;
  final String val2;

  const Packagedetailslocation({
    Key? key,
    required this.val1,
    required this.val2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: SizedBox(
        height: 160.h,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Padding(
            padding: EdgeInsets.only(top: 10.h, left: 20, right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(children: [
                  Image.asset(AppImages.pickUp, width: 20.w, height: 19.99.h),
                  const SizedBox(
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
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                          child: Text(
                        val1,
                        style: TextStyle(
                            fontFamily: 'CerebriSansPro-Regular',
                            color: AppColor.mainColor,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400),
                      )),
                    ],
                  )
                ]),
                const Divider(
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
                  const SizedBox(
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
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          child: Text(
                        val2,
                        style: TextStyle(
                            fontFamily: 'CerebriSansPro-Regular',
                            color: AppColor.mainColor,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400),
                      )),
                      const SizedBox(
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
