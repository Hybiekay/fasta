import 'package:flutter/material.dart';
import 'package:ziklogistics/constants/appImages.dart';
import 'package:ziklogistics/constants/appocolor.dart';

import '../../components/Widget/Slider.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.09,
                ),
                SizedBox(
                  width: 250,
                  height: MediaQuery.of(context).size.height * 0.38,
                  child: Image.asset(AppImages.onboardScreenImage2,
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
                          const Center(
                            child: Text(
                              'Confirm Your Dispatcher',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColor.whiteColor,
                                  fontFamily: 'DMSans',
                                  fontSize: 28,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  height: 1.5),
                            ),
                          ),
                          const Text(
                            'Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit. ',
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
                            position: 30,
                          ),
                        ])),
              ])),
    );
  }
}
