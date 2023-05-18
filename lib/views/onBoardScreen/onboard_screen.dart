import 'package:flutter/material.dart';
import '../../components/Widget/slider.dart';
import 'package:ziklogistics/constants/app_color.dart';
import 'package:ziklogistics/constants/app_images.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

class OnboardingScreen extends StatelessWidget {
  final bool isDriver;
  const OnboardingScreen({super.key, this.isDriver = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(
            color: AppColor.mainColor,
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.09,
                ),
                SizedBox(
                  width: 250,
                  height: MediaQuery.of(context).size.height * 0.38,
                  child: Image.asset(AppImages.onboardScreenImage1,
                      fit: BoxFit.fitWidth),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.45,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Center(
                            child: Text(
                              isDriver ? "Get a request" : 'Make A Request',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontFamily: 'DMSans',
                                  fontSize: 28,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w700,
                                  height: 1.5),
                            ),
                          ),
                          Text(
                            isDriver
                                ? "By signing up as dispatcher you are eligible to get a request. As a dispatcher get a request by receiving a shipping for package. "
                                : 'By signing up as customer, you are eligible to make a request. \nAs a customer make a request by creating a package ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColor.whiteColor,
                                fontFamily: 'DMSans',
                                fontSize: 20,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                                height: 1.5),
                          ),
                          SliderWidget(
                            position: 0,
                          ),
                        ])),
              ])),
    );
  }
}
