import 'dart:developer';
import 'package:get/get.dart';
import 'package:ziklogistics/Apis/bank_api.dart';
import 'package:ziklogistics/Apis/auth_service.dart';
import 'package:ziklogistics/global_components/ziklogistics.dart';

// ignore: unused_import

class CustomerController extends GetxController {
  final UserApiController _apiController = UserApiController();
  bool state = false;

  Future<void> loginUser(String email, String phoneNumber) async {
    try {
      var data = await _apiController.signUpCostumer(
        email: email,
        phoneNumber: phoneNumber,
      );
      return data;
    } catch (e) {
      Get.snackbar(
        'Error',
        "Email has ben used by Another User Kindly check your Email Or Change to another email",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future getOtp({required String code, required String phoneNumber}) async {
    try {
      final user =
          await _apiController.verifyOtp(phoneNumber: phoneNumber, code: code);
      if (kDebugMode) {
        print("contoller: $code");
      }
      return user;
    } catch (e) {
      Get.snackbar(e.toString(), e.toString());
    }
  }

  Future updateName({required String name, required String phoneNumber}) async {
    try {
      final data = await _apiController.updateCostumerName(
        phoneNumber: phoneNumber,
        name: name,
      );
      return data;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future createPackage({
    required String userName,
    required String discription,
    required String distance,
    required int size,
    required int width,
    required int height,
    required int weight,
    required String price,
    required String pickupAdrress,
    required String pickupLat,
    required String pickupLon,
    required String dropoffAdress,
    required String dropoffLat,
    required String dropoffLon,
    required String time,
    required bool isSchedule,
    required boundNe,
    required boundSw,
    required String polyLine,
    String scheduledTime = "isNotSchedule",
    String scheduleddate = "isNotSchedule",
  }) async {
    state = true;
    try {
      final package = await _apiController.sendAPackage(
        polyLine: polyLine,
        boundNe: boundNe,
        boundSw: boundSw,
        height: height,
        weight: weight,
        distance: distance,
        time: time,
        userName: userName,
        discription: discription,
        size: size,
        width: width,
        price: price,
        pickupAdrress: pickupAdrress,
        pickupLat: pickupLat,
        pickupLon: pickupLon,
        dropoffAdress: dropoffAdress,
        dropoffLat: dropoffLat,
        dropoffLon: dropoffLon,
        isSchedule: isSchedule,
        scheduleddate: scheduleddate,
        scheduledTime: scheduledTime,
      );
      state = false;
      return package;
    } catch (e) {
      state = false;

      if (kDebugMode) {
        print(e);
      }
    }
  }

  Stream<dynamic> fetchHistoryPeriodically({required String status}) async* {
    while (true) {
      try {
        final data = await _apiController.getCustomerHistory(status: status);
        yield data;
      } catch (e) {
        yield e;
      }
      await Future.delayed(Duration(seconds: 2));
    }
  }

// Start the periodic timer to send subsequent requests
  Future<void> startListeningToChanges(String status) async {
    bool isAcceptedDriverFound = false;
    while (!isAcceptedDriverFound) {
      try {
        final data = await _apiController.getCustomerHistory(status: status);
        if (data["acceptedDriverId"] != null) {
          log("${data["acceptedDriverId"]} has data");
          isAcceptedDriverFound = true;
        } else {
          log("${data["acceptedDriverId"]} has Nodata");
        }
      } catch (e) {
        // Handle any errors or exceptions that may occur during the API request
        log('Error: $e');
      }
      await Future.delayed(Duration(seconds: 3));
    }
  }

  Future getHistory({required String status}) async {
    try {
      final data = await _apiController.getCustomerHistory(status: status);
      return data; // Add the new data to the stream
    } catch (e) {
      // Add any errors to the stream
    }
  }

  // Fetch data initially

  Future getPackage({required String packageId}) async {
    try {
      final data = await _apiController.getCustomerGetPackage(
        packageId: packageId,
      );
      return data;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<List> getListOfDelivery({required String status}) async {
    try {
      final data = await _apiController.getCustomerListOfDelivery(
        status: status,
      );
      return data as List;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      rethrow;
    }
  }

  Future getCardDelivery({required String status}) async {
    try {
      final data = await BankApi.getCards();
      return data;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
