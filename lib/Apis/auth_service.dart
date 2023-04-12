import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ziklogistics/controllers/storage.dart';
import 'package:ziklogistics/models/create_package.dart';
import 'package:ziklogistics/views/auth/login_screen.dart';
import 'package:ziklogistics/global_components/ziklogistics.dart';

// ignore_for_file: file_names

class UserApiController extends GetxController {
  Future signUCostumer({
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
      String otp = data["otp"]['data']['data']['token'];
      Storage.saveCustomerOtp(otp);
      return data;
    } else {
      throw Exception('Failed to login user');
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
    Storage.saveData(response.body);

    if (response.statusCode == 201) {
      if (kDebugMode) {
        print(response.statusCode);
        print(response.body);
      }
      Storage.saveData(response.body);
      Storage.saveStatusCode("${response.statusCode}");

      final data = json.decode(response.body);
      Storage.saveToken(data["token"]);
      print(data['token']);
      return data;
    } else {
      if (kDebugMode) {
        print(response.statusCode);
        print(response.body);
      }

      throw Exception('Failed to login user');
    }
  }

  Future updateCostumerName({
    required String token,
    required String name,
    required String phoneNumber,
  }) async {
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
      Storage.saveData(response.body);
      return data;
    } else {
      if (kDebugMode) {
        print("error Occur");
      }
    }
  }

  CreatePackageRequest request = CreatePackageRequest(
      name: "Ademola ibukun",
      description: "This is description",
      size: 10,
      weight: 10,
      width: 10,
      height: 10,
      pickupLat: "437843784",
      pickupLon: "7832721",
      pickupAddress: "sg",
      dropoffLat: "string",
      dropoffLon: "string",
      dropoffAddress: "string",
      scheduledDate: "string",
      scheduledTime: "string",
      isScheduled: true,
      price: "1000",
      distance: "102",
      duration: "10",
      month: "string",
      year: "string");

  Future sendAPackage({
    required String token,
    required String userName,
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
  }) async {
    print(request.toJson());
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
      "pickup_object": {"boundNe": boundNe, "boundSw": boundSw},
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
        print('POST request success! Response: ${response.body}');
        // Do something with the response
        final data = json.decode(response.body);
        // print("this  is data ${data["data"]["id"]}");
        return data;
      } else {
        print('POST request failed. Status code: ${response.body}');
        // Handle the error
      }
    } catch (e) {
      print('Error sending POST request: $e');
      // Handle the exception
    }
  }

  Future getCustomerHistory({
    required String token,
    required String status,
  }) async {
    final url =
        Uri.parse("${AppApis.endPoint}customer/history-grouped?status=$status");
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (kDebugMode) {
      print(response.body);
      if (response.statusCode == 401) {
        Get.to(() => const LoginScreen());
      }
    }
    return json.decode(response.body);
  }

  Future getCustomerGetPackage({
    required String token,
    required String packageId,
  }) async {
    final url = Uri.parse("${AppApis.endPoint}customer/history");
    final response = await http.post(url, headers: {
      'Authorization': 'Bearer $token',
    }, body: {
      "id": packageId
    });
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 401) {
      Get.to(() => const LoginScreen());
    }
    return json.decode(response.body);
  }

  Future getCustomerListOfDelivery(
      {required String token, required String status}) async {
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
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 401) {
      Get.to(() => const LoginScreen());
    }
    return json.decode(response.body);
  }

  Future getGetPackage({
    required String token,
    required String packageId,
  }) async {
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
