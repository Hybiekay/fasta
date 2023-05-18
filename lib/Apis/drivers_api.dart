import 'dart:io';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ziklogistics/controllers/controllers.dart';
import 'package:ziklogistics/controllers/global_token.dart';
import 'package:ziklogistics/global_components/ziklogistics.dart';
import 'package:ziklogistics/Dispatcher/views/Dispatcherauth/login_screen.dart';

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
      "email": email.toLowerCase(),
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
    print(response.body);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 201) {
      final data = json.decode(response.body);
      final token = data["token"];
      DStorage.saveDriverData(response.body);
      DStorage.saveDriverToken(token);
      print(response.statusCode);
      print(response.body);
      GlobalStorage.saveToken(token);

      return data;
    } else {
      print("error Occur");
    }
  }

  Future updateDriverName({
    required String name,
    required String phoneNumber,
    required String accountName,
    required String accountNumber,
    required String bankName,
    required String paymentOption,
  }) async {
    String token = await DStorage.getDriverToken();

    final updateDriverNameUrl =
        Uri.parse("${AppApis.endPoint}auth/update-profile-driver");
    final response = await http.post(
      updateDriverNameUrl,
      headers: {
        'Authorization': 'Bearer $token',
      },
      body: {
        "name": name,
        "accountName": accountName,
        "accountNumber": accountNumber,
        "bankName": bankName,
        "paymentOption": paymentOption,
        "phone": phoneNumber,
      },
    );
    if (response.statusCode == 201) {
      print(response.body);

      final data = json.decode(response.body);
      return data;
    } else {
      print(response.body);
      print(response.statusCode);
      throw Exception();
    }
  }

  Future driverUpload({
    required String bvn,
    required String nin,
    required String name,
    required File dobImage,
    required File ninImage,
    required File driverLicenseImage,
  }) async {
    String token = await DStorage.getDriverToken();
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

    DStorage.saveCompleteData(data);
    print(data);
    return json.decode(data);
  }

  Future getAllRequt() async {
    String token = await DStorage.getDriverToken();
    final getAllRequtOtpUrl =
        Uri.parse("${AppApis.endPoint}driver/get-dispatch-requests");
    final response = await http.get(
      getAllRequtOtpUrl,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    final data = json.decode(response.body) as List;
    if (response.statusCode == 401) {
      Get.to(() => const DispatcherLoginScreen());
    }
    return data;
  }

  Future getSingleRequt({
    required String packageId,
  }) async {
    String token = await DStorage.getDriverToken();
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

    return json.decode(response.body);
  }

  Future acceptPackage({
    required String packageId,
  }) async {
    String token = await DStorage.getDriverToken();
    final url =
        Uri.parse("${AppApis.endPoint}driver/accept-package/$packageId");
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 401) {
      Get.to(() => const DispatcherLoginScreen());
    }
    final data = json.decode(response.body);
    return data;
  }

  Future rejectPackage({
    required String packageId,
  }) async {
    String token = await DStorage.getDriverToken();
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
    required String packageId,
    required String status,
  }) async {
    String token = await DStorage.getDriverToken();
    final url =
        Uri.parse("${AppApis.endPoint}driver/change-package-status/$packageId");
    final response = await http.post(url, headers: {
      'Authorization': 'Bearer $token',
    }, body: {
      "status": status
    });

    print(response.statusCode);
    if (response.statusCode == 401) {
      Get.to(() => const DispatcherLoginScreen());
    }
    final data = json.decode(response.body);
    return data;
  }

  Future getHistory({
    required String status,
  }) async {
    String token = await DStorage.getDriverToken();
    final url =
        Uri.parse("${AppApis.endPoint}driver/history-grouped?status=$status");
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    // print(response.body);
    if (response.statusCode == 401) {
      Get.to(() => const DispatcherLoginScreen());
    }
    final data = json.decode(response.body);
    return data;
  }

  Future getDriverDetials() async {
    String token = await DStorage.getDriverToken();
    final url = Uri.parse("${AppApis.endPoint}driver/profile");
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    // print(response.body);
    if (response.statusCode == 401) {
      Get.to(() => const DispatcherLoginScreen());
    }
    final data = json.decode(response.body);
    return data;
  }

}
