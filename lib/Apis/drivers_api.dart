import 'dart:io';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ziklogistics/controllers/controllers.dart';
import 'package:ziklogistics/global_components/ziklogistics.dart';
import 'package:ziklogistics/Dispatcher/views/Dispatcherauth/login_Screen.dart';

// ignore_for_file: avoid_print
class DriverApiController extends GetxController {
  static Future signInDriver({
    required String phoneNumber,
    required String email,
    required String month,
    required String year,
  }) async {
    final singnInUrl = Uri.parse("${AppApis.endPoint}auth/signin-driver");
    final response = await http.post(singnInUrl, body: {
      "phone": phoneNumber,
      "email": email,
      "month": month,
      "year": year
    });
    print(response.statusCode);
    print(response.body);
    final data = json.decode(response.body);

    print(data["otp"]['data']['data']['token']);
    String otp = data["otp"]['data']['data']['token'];
    DStorage.saveDriverOtp(otp);
    return data;
  }

  static Future verifyOtp({
    required String phoneNumber,
    required String code,
  }) async {
    final verifyOtpUrl = Uri.parse("${AppApis.endPoint}auth/verify-driver");
    final response = await http.post(verifyOtpUrl, body: {
      "phone": phoneNumber,
      "code": code,
    });
    final data = json.decode(response.body);
    final token = data["token"];
    DStorage.saveDriverData(response.body);
    DStorage.saveDriverToken(token);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 201) {
      print(response.statusCode);
      print(response.body);
      final data = json.decode(response.body);

      return data;
    } else {
      print("error Occur");
    }
  }

  Future updateDriverName({
    required String token,
    required String name,
    required String phoneNumber,
    required String accountName,
    required String accountNumber,
    required String bankNam,
    required String paymentOption,
  }) async {
    final updateCostumerNameUrl =
        Uri.parse("${AppApis.endPoint}auth/update-name-customer");
    final response = await http.post(updateCostumerNameUrl, headers: {
      'Authorization': 'Bearer $token',
    }, body: {
      "name": name,
      "phone": phoneNumber,
    });
    print(response.statusCode);
    print(response.body);
    DStorage.saveDriverData(response.body);
    return json.decode(response.body);
  }

  Future driverUpload({
    required String token,
    required String bvn,
    required String nin,
    required String name,
    required File dobImage,
    required File ninImage,
    required File driverLicenseImage,
  }) async {
    print("the tokon is $token");
    final url =
        Uri.parse("${AppApis.endPoint}driver/complete-driver-registration");
    final response = http.MultipartRequest("POST", url);
    response.headers.addAll({'Authorization': 'Bearer $token'});
    response.fields["nin"] = nin;
    response.fields["name"] = name;
    response.fields["bvn"] = bvn;
    var dImage = await http.MultipartFile.fromPath("dobImage", dobImage.path);
    var nImage = await http.MultipartFile.fromPath("ninImage", ninImage.path);
    var driverImage = await http.MultipartFile.fromPath(
        "driverLicenseImage", driverLicenseImage.path);

    response.files.addAll([dImage, nImage, driverImage]);

    final result = await response.send();
    final resultData = await result.stream.toBytes();
    final data = String.fromCharCodes(resultData);

    DStorage.saveDriverData(data);
    print(data);
    return json.decode(data);
  }

  Future getAllRequt({
    required String token,
  }) async {
    final getAllRequtOtpUrl =
        Uri.parse("${AppApis.endPoint}driver/get-dispatch-requests");
    final response = await http.get(
      getAllRequtOtpUrl,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    print("this is the body ${response.body}");

    final data = json.decode(response.body) as List;
    if (response.statusCode == 401) {
      Get.to(() => const DispatcherLoginScreen());
    }
    return data;
  }

  Future getSingleRequt({
    required String token,
    required String packageId,
  }) async {
    final getAllRequtOtpUrl =
        Uri.parse("${AppApis.endPoint}driver/get-dispatch-request/$packageId");
    final response = await http.get(
      getAllRequtOtpUrl,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 401) {
      Get.to(() => const DispatcherLoginScreen());
    }
    print(response.body);
    return json.decode(response.body);
  }

  Future acceptPackage({
    required String token,
    required String packageId,
  }) async {
    final url =
        Uri.parse("${AppApis.endPoint}driver/accept-package/$packageId");
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    print(response.body);
    if (response.statusCode == 401) {
      Get.to(() => const DispatcherLoginScreen());
    }
    final data = json.decode(response.body);
    return data;
  }

  Future rejectPackage({
    required String token,
    required String packageId,
  }) async {
    final url =
        Uri.parse("${AppApis.endPoint}driver/reject-package/$packageId");
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    print(response.body);
    final data = json.decode(response.body);
    return data;
  }

  Future changePackageStatus({
    required String token,
    required String packageId,
    required String status,
  }) async {
    final url =
        Uri.parse("${AppApis.endPoint}driver/change-package-status$packageId");
    final response = await http.post(url, headers: {
      'Authorization': 'Bearer $token',
    }, body: {
      "status": {status}
    });
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 401) {
      Get.to(() => const DispatcherLoginScreen());
    }
    final data = json.decode(response.body);
    return data;
  }

  Future getHistory({
    required String token,
    required String status,
  }) async {
    final url =
        Uri.parse("${AppApis.endPoint}driver/history-grouped?status=$status");
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    print(response.body);
    if (response.statusCode == 401) {
      Get.to(() => const DispatcherLoginScreen());
    }
    final data = json.decode(response.body);
    return data;
  }
}
