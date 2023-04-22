import 'dart:io';
import 'package:get/get.dart';
import 'package:ziklogistics/Apis/drivers_api.dart';
import 'package:ziklogistics/global_components/ziklogistics.dart';

class DriverController extends GetxController {
  final DriverApiController _apiController = DriverApiController();
  bool state = false;

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
    required String driverAccName,
    required String driverAccNum,
    required String driverBank,
    required String paymentOption,
  }) async {
    state = true;
    try {
      final data = await _apiController.updateDriverName(
        phoneNumber: phoneNumber,
        name: name,
        accountName: driverAccName,
        accountNumber: driverAccNum,
        bankName: driverBank,
        paymentOption: paymentOption,
      );
      state = false;
      return data;
    } catch (e) {
      if (kDebugMode) {
        state = false;
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
    state = true;
    try {
      final data = await _apiController.driverUpload(
        bvn: bvn,
        name: name,
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

  Stream<List<dynamic>> getAllRequest() async* {
    StreamController<List<dynamic>> streamController =
        StreamController<List<dynamic>>();

    void fetchData() async {
      try {
        final data = await _apiController.getAllRequt();
        streamController.add(data as List);
      } catch (e) {
        streamController.addError(e);
      }
    }

    // Fetch data initially
    fetchData();

    // Fetch data every 10 seconds
    Timer.periodic(const Duration(seconds: 10), (timer) {
      fetchData();
    });

    yield* streamController.stream;
  }

  Future getSingleRequest(String packageId) async {
    try {
      final data = await _apiController.getSingleRequt(packageId: packageId);
      return data;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future acceptPackage({required String packageId}) async {
    try {
      final data = await _apiController.acceptPackage(packageId: packageId);
      return data;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future rejectPackage({required String packageId}) async {
    try {
      final data = await _apiController.rejectPackage(packageId: packageId);
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
      if (kDebugMode) {
        print(packageId);
      }
      final data = await _apiController.changePackageStatus(
          packageId: packageId, status: status);
      return data;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future getHistory({required String status}) async {
    try {
      final data = await _apiController.getHistory(status: status);
      return data;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      rethrow;
    }
  }
}
