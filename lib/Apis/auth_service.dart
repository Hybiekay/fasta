import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ziklogistics/controllers/storage.dart';
import 'package:ziklogistics/views/auth/login_screen.dart';
import 'package:ziklogistics/controllers/global_token.dart';
import 'package:ziklogistics/global_components/ziklogistics.dart';

// ignore_for_file: file_names

class UserApiController extends GetxController {
  Future signUpCostumer({
    required String year,
    required String month,
    required String phoneNumber,
    required String email,
  }) async {
    final singnInUrl = Uri.parse("${AppApis.endPoint}auth/signin-customer");
    final response = await http.post(singnInUrl, body: {
      "phone": phoneNumber,
      "email": email,
      "month": month,
      "year": year
    });

    if (response.statusCode == 201) {
      final data = json.decode(response.body);
      if (kDebugMode) {
        print(response.statusCode);
        print(data["otp"]['data']['data']['token']);
      }
      var otp = data["otp"]['data']['data']['token'];
      Storage.saveCustomerOtp(otp);
      return data;
    } else {
      throw response.body;
    }
  }

  Future verifyOtp({
    required String phoneNumber,
    required String code,
  }) async {
    final verifyOtpUrl = Uri.parse("${AppApis.endPoint}auth/verify-customer");
    final response = await http.post(verifyOtpUrl, body: {
      "phone": phoneNumber,
      "code": code,
    });

    if (response.statusCode == 201) {
      if (kDebugMode) {
        print(response.statusCode);
        print(response.body);
      }
      Storage.saveData(response.body);
      Storage.saveStatusCode("${response.statusCode}");

      final data = json.decode(response.body);
      Storage.saveToken(data["token"]);
      GlobalStorage.saveToken(data["token"]);
      return data;
    } else {
      if (kDebugMode) {
        print(response.statusCode);
        print(response.body);
      }

      throw Exception();
    }
  }

  Future updateCostumerName({
    required String name,
    required String phoneNumber,
  }) async {
    var token = await Storage.getToken();
    final updateCostumerNameUrl =
        Uri.parse("${AppApis.endPoint}auth/update-name-customer");
    if (kDebugMode) {
      print("token: $token");
    }
    final response = await http.post(updateCostumerNameUrl, body: {
      "name": name,
      "phone": phoneNumber,
    }, headers: {
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 201) {
      if (kDebugMode) {
        print(response.body);
        print(response.statusCode);
      }
     
      final data = json.decode(response.body);
      final name = data["name"];
      Storage.savename(name);

      return data;
    } else {
      if (kDebugMode) {
        print("error Occur");
      }

      throw Exception();
    }
  }

  Future sendAPackage(
      {required String userName,
      required String discription,
      required int size,
      required int width,
      required int weight,
      required int height,
      required String price,
      required String pickupLat,
      required String pickupLon,
      required String pickupAdrress,
      required String dropoffLat,
      required String dropoffLon,
      required String dropoffAdress,
      required String distance,
      required String time,
      required bool isSchedule,
      required String scheduleddate,
      required String scheduledTime,
      required String month,
      required String year,
      required boundNe,
      required boundSw,
      required String polyLine}) async {
    var token = await Storage.getToken();

    final createPackageUrl =
        Uri.parse("${AppApis.endPoint}customer/create-package");
    final body = {
      "name": userName,
      "description": discription,
      "size": size,
      "weight": weight,
      "width": width,
      "height": height,
      "pickup_lat": pickupLat,
      "pickup_lon": pickupLon,
      "pickup_address": pickupAdrress,
      "pickup_object": {
        "boundNe": boundNe,
        "boundSw": boundSw,
        "polyLine": polyLine
      },
      "dropoff_lat": dropoffLat,
      "dropoff_lon": dropoffLon,
      "dropoff_address": dropoffAdress,
      "scheduled_date": scheduleddate,
      "scheduled_time": scheduledTime,
      "isScheduled": isSchedule,
      "price": price,
      "distance": distance,
      "duration": time,
      "month": month,
      "year": year
    };

    try {
      final response = await http.post(
        createPackageUrl,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 201) {
        // Do something with the response
        final data = json.decode(response.body);
        // print("this  is data ${data["data"]["id"]}");
        return data;
      } else {
        // Handle the error
      }
    } catch (e) {
      // Handle the exception
    }
  }

  Future getCustomerHistory({
    required String status,
  }) async {
    var token = await Storage.getToken();

    final url =
        Uri.parse("${AppApis.endPoint}customer/history-grouped?status=$status");
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 401) {
      Get.to(() => const LoginScreen());
    }
    return json.decode(response.body);
  }

  Future getCustomerGetPackage({
    required String packageId,
  }) async {
    var token = await Storage.getToken();

    final url = Uri.parse("${AppApis.endPoint}customer/get-package");
    final response = await http.post(url, headers: {
      'Authorization': 'Bearer $token',
    }, body: {
      "id": packageId
    });

    if (response.statusCode == 401) {
      Get.to(() => const LoginScreen());
    }
    final data = json.decode(response.body)['data'];
    return data;
  }

  Future getCustomerListOfDelivery({required String status}) async {
    var token = await Storage.getToken();

    if (kDebugMode) {
      print(token);
    }
    final url =
        Uri.parse("${AppApis.endPoint}customer/history-grouped?status=$status");
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    // if (kDebugMode) {
    //   print(response.body);
    // }
    if (response.statusCode == 401) {
      Get.to(() => const LoginScreen());
    }
    return json.decode(response.body);
  }

  Future getGetPackage({
    required String packageId,
  }) async {
    var token = await Storage.getToken();

    final url =
        Uri.parse("${AppApis.endPoint}/customer/get-package/$packageId");
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 401) {
      Get.to(() => const LoginScreen());
    }
    return json.decode(response.body);
  }
}
