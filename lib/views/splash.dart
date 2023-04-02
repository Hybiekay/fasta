// ignore_for_file: prefer_const_literals_to_create_immutables




import 'package:flutter/material.dart';
import 'package:ziklogistics/constants/appImages.dart';
import 'package:ziklogistics/constants/appocolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.mainColor,
        body: Stack(
          children: [
            Center(
              child: Image.asset(
                AppImages.logo,
                filterQuality: FilterQuality.high,
              ),
            ),
            // Spacer(),
            Positioned(
              bottom: 0,
              child: Container(
                  width: MediaQuery.of(context).size.width.w,
                  height: 200.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AppImages.backGroundImage),
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.fitWidth),
                  )),
            ),
          ],
        ));
  }
}
