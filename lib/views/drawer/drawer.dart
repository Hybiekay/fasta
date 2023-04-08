import 'package:flutter/material.dart';
import 'package:ziklogistics/views/drawer/body.dart';

class DrawerScreen extends StatelessWidget {
  static const String routeName = '/drawerScreen';
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Body());
  }
}
