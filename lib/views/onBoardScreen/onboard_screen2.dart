import 'package:flutter/material.dart';
import 'package:ziklogistics/components/Widget/Slider.dart';
import 'package:ziklogistics/constants/app_color.dart';
import 'package:ziklogistics/constants/app_images.dart';

class OnboardingScreen2 extends StatelessWidget {
  final bool isDriver;
  const OnboardingScreen2({super.key, this.isDriver = false});

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
                          Center(
                            child: Text(
                              isDriver
                                  ? "Confirm Your Dispatch"
                                  : 'Confirm Your Dispatcher',
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
                          Text(
                            isDriver
                                ? " By confirming your dispatch be assured that your dispatch request was provided based on your location."
                                : 'By confirming your dispatcher be assured that your package has been linked to a right and nearby dispatcher ready for pickup.',
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
