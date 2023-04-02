import 'package:flutter/material.dart';
import 'package:ziklogistics/views/home/body.dart';
// ignore_for_file: prefer_const_literals_to_create_immutables

class CostomerHome extends StatelessWidget {
  static const String routeName = '/costomerHome';
  const CostomerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: CostomerHomeBody());
  }
}
