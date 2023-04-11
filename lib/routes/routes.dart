import 'package:flutter/material.dart';
import 'package:ziklogistics/views/home/home.dart';
import 'package:ziklogistics/views/drawer/drawer.dart';
import 'package:ziklogistics/views/auth/login_screen.dart';
import 'package:ziklogistics/views/DeliveryH/delivery_history.dart';
import 'package:ziklogistics/views/onBoardScreen/choiceScreen.dart';
import 'package:ziklogistics/views/send_package_1/send_package_1.dart';
import 'package:ziklogistics/Dispatcher/views/DispatcherHome/home.dart';
import 'package:ziklogistics/Dispatcher/views/Dispatcherdrawer/drawer.dart';
import 'package:ziklogistics/Dispatcher/views/Dispatcherauth/driver_form.dart';
import 'package:ziklogistics/Dispatcher/views/Dispatcherauth/login_screen.dart';
import 'package:ziklogistics/Dispatcher/views/DispatcherH/delivery_history.dart';

final Map<String, WidgetBuilder> routes = {
  CostomerHome.routeName: (context) => const CostomerHome(),
  DrawerScreen.routeName: (context) => const DrawerScreen(),
  ChoiceScreen.routeName: (context) => const ChoiceScreen(),
  SendPackage1.routeName: (context) => const SendPackage1(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  Deliveryhistory.routeName: (context) => const Deliveryhistory(),
  DispatcherLoginScreen.routeName: (context) => const DispatcherLoginScreen(),
  DispatcherHome.routeName: (context) => const DispatcherHome(),
  DispatcherDrawerScreen.routeName: (context) => const DispatcherDrawerScreen(),
  DispatcherDeliveryhistory.routeName: (context) =>
      const DispatcherDeliveryhistory(),
  DriverForm.routeName: (context) => const DriverForm(),
};
