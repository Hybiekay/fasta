import 'package:flutter/material.dart';
import '../../constants/app_color.dart';
import 'package:ziklogistics/constants/app_images.dart';
import 'package:ziklogistics/views/auth/login_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore_for_file: file_names



class CustomerWelcomeScreen extends StatelessWidget {
  const CustomerWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: AppColor.mainColor,
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AppImages.onboardScreenImage4),
                          fit: BoxFit.fitWidth),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    'Ready to get \nStarted as \nA Customer!',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: AppColor.whiteColor,
                      fontFamily: 'DM Sans',
                      fontSize: 40.h,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w700,
                      height: 1.1,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 40.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.whiteColor),
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(LoginScreen.routeName);
                        },
                        child: Text(
                          'Get Started',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColor.mainColor,
                              fontFamily: 'DMSans',
                              fontSize: 20.sp,
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                              height: 1.5),
                        )),
                  ),
                ),
              ])),
    );
  }
}
