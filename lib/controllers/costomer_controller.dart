import 'package:get/get.dart';
import 'package:ziklogistics/Apis/bankApi.dart';
import 'package:ziklogistics/Apis/authService.dart';
import 'package:ziklogistics/controllers/storage.dart';
import 'package:ziklogistics/global_components/ziklogistics.dart';
// ignore: unused_import

class CustomerController extends GetxController {
  late final UserApiController _apiController;

  late String Otoken;
  @override
  void onInit() async {
    super.onInit();

    _apiController = UserApiController();

    Otoken = await Storage.getToken();
  }

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
        token: Otoken,
      );
      return data;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future createPackage(
      {required String userName,
      required String discription,
      required String distance,
      required int size,
      required int width,
      required String price,
      required String pickupAdrress,
      required String pickupLat,
      required String pickupLon,
      required String dropoffAdress,
      required String dropoffLat,
      required String dropoffLon,
      required double time,
      required bool isSchedule,
      String scheduledTime = "isNotSchedule",
      String scheduleddate = "isNotSchedule"}) async {
    try {
      final package = await _apiController.sendAPackage(
          distance: distance,
          time: time,
          token: Otoken,
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
       status:status ,
        token: Otoken,
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
        token: Otoken,
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
        token: Otoken,
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
      final data = await BankApi.getCards(
        token: Otoken,
      );
      return data;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
