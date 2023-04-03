import 'package:get/get.dart';
import 'views/home/home.dart';
import 'package:flutter/material.dart';
import 'views/onBoardScreen/choiceScreen.dart';
import 'package:ziklogistics/routes/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ziklogistics/Dispatcher/views/DispatcherHome/home.dart';
import 'package:ziklogistics/Dispatcher/views/Dispatcherauth/d_register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  // late final DriverApiController _apiController;

    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            title: 'ZikLogistics',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(),
            initialRoute: ChoiceScreen.routeName,
            routes: routes,
            // home:
            //     // CostomerHome()
            //     DispatcherHome()
            // // DRegisterScreen(phoneNum: ""),
          );
        });
  }
}
