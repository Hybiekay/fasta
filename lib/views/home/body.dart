import 'package:get/get.dart';
import '../drawer/drawer.dart';
import 'package:flutter/material.dart';
import '../../constants/appImages.dart';
import '../../constants/appocolor.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../global_components/button_component.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ziklogistics/views/send_package_1/send_package_1.dart';

class CostomerHomeBody extends StatelessWidget {
  const CostomerHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width.w,
          height: 328.h,
          color: AppColor.whiteColor,
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => DrawerScreen());
                    // Navigator.of(context).pushNamed(DrawerScreen.routeName);
                  },
                  child: Image.asset(
                    AppImages.menuBar,
                    filterQuality: FilterQuality.high,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  'Send packages with Ziklogistics',
                  style: GoogleFonts.dmSans(
                    color: AppColor.mainColor,
                    fontSize: 35.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  'Get it delivered in the time it takes to drive there!',
                  style: GoogleFonts.dmSans(
                    color: AppColor.mainColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          )),
        ),
        Expanded(
            child: Container(
          width: MediaQuery.of(context).size.width.w,
          color: AppColor.mainColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.homePageImage,
                width: 300.w,
                height: 158.h,
                filterQuality: FilterQuality.high,
              ),
              SizedBox(
                height: 50.h,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                child: ButtonComp(
                    onPressed: () {
                      Navigator.of(context).pushNamed(SendPackage_1.routeName);
                    },
                    value: 'Send A Package'),
              )
            ],
          ),
        ))
      ],
    );
  }
}
