import 'package:get/get.dart';
import 'package:ziklogistics/Apis/bank_api.dart';
import 'package:ziklogistics/Apis/auth_service.dart';
import 'package:ziklogistics/global_components/ziklogistics.dart';
// ignore: unused_import

class CustomerController extends GetxController {
  final UserApiController _apiController = UserApiController();


  Future<void> loginUser(String email, String phoneNumber) async {
    try {
      await _apiController.signUCostumer(
          email: email,
          phoneNumber: phoneNumber,
          month: "${DateTime.now().month}",
          year: "${DateTime.now().year}");
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future getOtp({required String code, required String phoneNumber}) async {
    try {
      await _apiController.verifyOtp(phoneNumber: phoneNumber, code: code);
      if (kDebugMode) {
        print("contoller: $code");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
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
    try {
      final package = await _apiController.sendAPackage(
       polyLine:polyLine ,
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
          month: "${DateTime.now().month}",
          year: "${DateTime.now().year}");
      return package;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future getHistory({required String status}) async {
    try {
      final data = await _apiController.getCustomerHistory(
        status: status,
      );
      return data;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

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
