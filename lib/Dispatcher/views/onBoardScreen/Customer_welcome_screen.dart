import 'package:flutter/material.dart';
import 'package:ziklogistics/Dispatcher/views/Dispatcherauth/login_Screen.dart';
import 'package:ziklogistics/constants/appImages.dart';
import 'package:ziklogistics/constants/appocolor.dart';

class DispatcherWelcomeScreen extends StatelessWidget {
  static const String routeName = '/ChioceScreen';
  const DispatcherWelcomeScreen({super.key});

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
                const Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    'Ready to get \nStarted as \nA Dispatcher!!',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: AppColor.whiteColor,
                      fontFamily: 'DM Sans',
                      fontSize: 40,
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
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.whiteColor),
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(DispatcherLoginScreen.routeName);
                        },
                        child: const Text(
                          'Get Started',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColor.mainColor,
                              fontFamily: 'DMSans',
                              fontSize: 20,
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
