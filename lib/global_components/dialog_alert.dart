import 'package:flutter/material.dart';
import 'package:ziklogistics/constants/app_images.dart';
import 'package:ziklogistics/global_components/button_component.dart';

successShowDialod({
  required BuildContext context,
  required String value,
  String bottonValue = "Done",
  required VoidCallback onPressed,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        icon: Image.asset(
          AppImages.successAlertImage,
          height: 100,
          width: 50,
        ),
        title: const Text("Successful"),
        // ignore: prefer_const_constructors
        content: Text(
          value,
          textAlign: TextAlign.center,
        ),
        actions: [ButtonComp(onPressed: onPressed, value: bottonValue)],
      );
    },
  );
}

failedShowDialod({
  required BuildContext context,
  required String value,
  required onPressed,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        icon: Image.asset(
          AppImages.failedAlertImage,
          height: 100,
          width: 50,
        ),
        title: const Text("Failed"),
        content: Text(
          value,
          textAlign: TextAlign.center,
        ),
        actions: [ButtonComp(onPressed: onPressed, value: "Done")],
      );
    },
  );
}

mainshowDialod({
  required BuildContext context,
  required String value,
  required onPressed,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        // ignore: prefer_const_constructors
        content: Text(
          value,
          textAlign: TextAlign.center,
        ),
        actions: [ButtonComp(onPressed: onPressed, value: "Close")],
      );
    },
  );
}
