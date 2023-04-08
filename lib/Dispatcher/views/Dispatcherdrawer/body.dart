import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ziklogistics/constants/app_color.dart';
import 'package:ziklogistics/models/driver_model.dart';
import 'package:ziklogistics/constants/app_images.dart';
import 'package:ziklogistics/controllers/controllers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ziklogistics/Dispatcher/views/Dispatcherdrawer/btn_comp.dart';
import 'package:ziklogistics/Dispatcher/views/DispatcherH/delivery_history.dart';
// inore_for_file: prefer_const_literals_to_create_immutables

class DispatcherBody extends StatefulWidget {
  const DispatcherBody({super.key});

  @override
  State<DispatcherBody> createState() => _DispatcherBodyState();
}

class _DispatcherBodyState extends State<DispatcherBody> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() {
    driverData = DStorage.getDriverData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width.w,
          height: 320.h,
          color: AppColor.whiteColor,
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    AppImages.close,
                    filterQuality: FilterQuality.high,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  children: [
                    Text(
                      DriverUserModel.name ?? "Login",
                      style: GoogleFonts.dmSans(
                        color: AppColor.mainColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 63,
                      height: 63,
                      decoration: BoxDecoration(
                          color: AppColor.mainColor,
                          borderRadius: BorderRadius.circular(50)),
                    )
                  ],
                ),
                SizedBox(
                  height: 35.h,
                ),
                DisBtnComp(onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DispatcherDeliveryhistory(),
                      ));
                })
              ],
            ),
          )),
        ),
        Expanded(
            child: Container(
          padding: const EdgeInsets.symmetric(vertical: 31, horizontal: 29),
          width: MediaQuery.of(context).size.width.w,
          color: AppColor.mainColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Image.asset(
                  AppImages.referAFriendImg,
                  width: 20.w,
                  height: 20.h,
                ),
                title: Text(
                  'Refer a friend',
                  style: GoogleFonts.dmSans(
                    color: AppColor.whiteColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              // SizedBox(
              //   height: 30.h,
              // ),
              ListTile(
                leading: Image.asset(
                  AppImages.referAFriendImg,
                  width: 20.w,
                  height: 20.h,
                ),
                title: Text(
                  'Contact',
                  style: GoogleFonts.dmSans(
                    color: AppColor.whiteColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              ListTile(
                leading: Image.asset(
                  AppImages.referAFriendImg,
                  width: 20.w,
                  height: 20.h,
                ),
                title: Text(
                  'Sign Out',
                  style: GoogleFonts.dmSans(
                    color: AppColor.whiteColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                'V1.1',
                style: GoogleFonts.dmSans(
                  color: AppColor.mainSecondryColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ))
      ],
    );
  }
}
