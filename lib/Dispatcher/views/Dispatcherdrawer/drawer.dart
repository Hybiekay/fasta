import 'package:flutter/material.dart';
import 'package:ziklogistics/Dispatcher/views/Dispatcherdrawer/body.dart';

class DispatcherDrawerScreen extends StatelessWidget {
  static const String routeName = '/dispatcherdrawerScreen';
  const DispatcherDrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: DispatcherBody());
  }
}
