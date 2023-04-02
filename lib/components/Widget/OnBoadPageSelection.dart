import 'package:flutter/material.dart';
import '../../views/onBoardScreen/Customer_welcome_screen.dart';
import 'package:ziklogistics/views/onBoardScreen/onboardScreen.dart';
import 'package:ziklogistics/views/onBoardScreen/onboardScreen2.dart';
import 'package:ziklogistics/views/onBoardScreen/onboardScreen3.dart';
import 'package:ziklogistics/Dispatcher/views/onBoardScreen/Customer_welcome_screen.dart';
// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

class OnBoardPages extends StatelessWidget {
  const OnBoardPages({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const [
        OnboardingScreen(),
        OnboardingScreen2(),
        OnboardingScreen3(),
        CustomerWelcomeScreen()
      ],
    );
  }
}

class DispatcherOnBoardPages extends StatelessWidget {
  const DispatcherOnBoardPages({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const [
        OnboardingScreen(),
        OnboardingScreen2(),
        OnboardingScreen3(),
        DispatcherWelcomeScreen()
      ],
    );
  }
}
