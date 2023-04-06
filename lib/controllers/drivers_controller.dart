import 'dart:io';
import 'package:get/get.dart';
import 'package:ziklogistics/Apis/drivers_api.dart';
import 'package:ziklogistics/controllers/storage.dart';
import 'package:ziklogistics/controllers/controllers.dart';
import 'package:ziklogistics/global_components/ziklogistics.dart';

class DriverController extends GetxController {
  late final DriverApiController _apiController;

  late String otoken;
  @override
  void onInit() async {
    otoken = await DStorage.getDriverToken();
    otoken = await DStorage.getDriverToken();
    super.onInit();
    _apiController = DriverApiController();
  }

  Future loginUser(String email, String phoneNumber) async {
    try {
      final result = await DriverApiController.signInDriver(
          email: email,
          phoneNumber: phoneNumber,
          month: "${DateTime.now().month}",
          year: "${DateTime.now().year}");
      return result;
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
      await DriverApiController.verifyOtp(phoneNumber: phoneNumber, code: code);
      if (kDebugMode) {
        print("contoller: $code");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future updateName({
    required String name,
    required String phoneNumber,
    driverAccName,
    driverAccNum,
    driverBank,
    paymentOption,
  }) async {
    try {
      if (kDebugMode) {
        print("Teken: $otoken");
      }
      await _apiController.updateDriverName(
        phoneNumber: phoneNumber,
        name: name,
        token: otoken,
        accountName: driverAccName,
        accountNumber: driverAccNum,
        bankNam: driverBank,
        paymentOption: paymentOption,
      );
      if (kDebugMode) {
        print("Teken: $otoken");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future uplold({
    required String name,
    required String bvn,
    required String nin,
    required File bvnImage,
    required File ninImage,
    required File dobImage,
  }) async {
    try {
      final data = await _apiController.driverUpload(
        bvn: bvn,
        name: name,
        token: otoken,
        nin: nin,
        driverLicenseImage: bvnImage,
        ninImage: ninImage,
        dobImage: dobImage,
      );
      return data;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<List<dynamic>> getAllRequest() async {
    try {
      final data = await _apiController.getAllRequt(token: otoken);
      // final stream = Stream.fromFuture(data);
      // print("this is the body ${stream}");
      return data as List;
    } catch (e) {
      rethrow;
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future getSingleRequest(String packageId) async {
    try {
      final data = await _apiController.getSingleRequt(
          token: otoken, packageId: packageId);
      return data;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future acceptPackage({required String packageId}) async {
    try {
      final data = await _apiController.acceptPackage(
          token: otoken, packageId: packageId);
      return data;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future rejectPackage({required String packageId}) async {
    try {
      final data = await _apiController.rejectPackage(
          token: otoken, packageId: packageId);
      return data;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future changePackageStatus(
      {required String packageId, required String status}) async {
    try {
      final data = await _apiController.changePackageStatus(
          token: otoken, packageId: packageId, status: status);
      return data;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future getHistory(String status) async {
    try {
      final data =
          await _apiController.getHistory(token: otoken, status: status);
      return data;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      rethrow;
    }
  }

  Future getTwoHistory(String status, status2) async {
    try {
      final data =
          await _apiController.getHistory(token: otoken, status: status);
      final data2 =
          await _apiController.getHistory(token: otoken, status: status2);
      final total = data + data2;
      return total;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
