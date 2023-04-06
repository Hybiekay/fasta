import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http_interceptor/http_interceptor.dart';

class RetryPolicy {
  @override
  Future shouldAttemptRetryOnResponse(
      {required ResponseData response,
      required Widget homeScreen,
      required Widget loginScreen}) async {
    if (response.statusCode == 401) {
      // Perform your token refresh here.

      Get.to(() => loginScreen);
    }

    Get.to(() => homeScreen);
  }
}
