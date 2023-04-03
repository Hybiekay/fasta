import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore: prefer_typing_uninitialized_variables
var driverData;

class DriverModel {
  String? token = driverData['token'];
}

class DriverUserModel {
  static String id = driverData["user"]["id"];
  static String? name = driverData["user"]["name"];
  static String? email = driverData["user"]["email"];
  static String? status = driverData["user"]["status"];
  static String? phone = driverData["user"]["phone"];
  static double? latitude = driverData["user"]["state"];
  static double? longitude = driverData["user"]["id"];
  static String? role = driverData["user"]["id"];
  static String? accountNumber = driverData["user"]["accountNumber"];
  static String? bankName = driverData["user"]["bankName"];
  static String? accountName = driverData["user"]["accountName"];
  static String? paymentOption = driverData["user"]["paymentOption"];
  static String? bvn = driverData["user"]["bvn"];
  static String? nin = driverData["user"]["nin"];
  static String? dobImage = driverData["user"]["dobImage"];
  static String? dobImageId = driverData["user"]["dobImageId"];
  static String? ninImage = driverData["user"]["ninImage"];
  static String? ninImageId = driverData["user"]["driverLicenseImage"];
  static String? driverLicenseImage =
      driverData["user"]["driverLicenseImageId"];
  static bool? isCompletedRegistration =
      driverData["user"]["isCompletedRegistration"];
}
