import 'package:flutter/material.dart';
import 'package:ziklogistics/constants/app_color.dart';
import 'package:ziklogistics/Dispatcher/views/DispatcherHome/dispatcher_home_body.dart';
// ignore_for_file: prefer_const_literals_to_create_immutables

class DispatcherHome extends StatelessWidget {
  static const String routeName = '/dispatcherhomeScreen';
  const DispatcherHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: AppColor.mainColor, body: DispatcherHomeBody());
  }
}
