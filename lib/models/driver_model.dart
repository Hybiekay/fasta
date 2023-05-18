import 'dart:convert';

var driverData;

var data = json.decode(driverData);

class DriverModel {
  static String? token = data["token"];
}

class DriverUserModel {
  static String id = data["user"]["id"];
  static String? name = data["user"]["name"];
  static String? email = data["user"]["email"];
  static String? status = data["user"]["status"];
  static String? phone = data["user"]["phone"];
  static double? latitude = data["user"]["state"];
  static double? longitude = data["user"]["id"];
  static String? role = data["user"]["id"];
  static String? accountNumber = data["user"]["accountNumber"];
  static String? bankName = data["user"]["bankName"];
  static String? accountName = data["user"]["accountName"];
  static String? paymentOption = data["user"]["paymentOption"];
  static String? bvn = data["user"]["bvn"];
  static String? nin = data["user"]["nin"];
  static String? dobImage = data["user"]["dobImage"];
  static String? dobImageId = data["user"]["dobImageId"];
  static String? ninImage = data["user"]["ninImage"];
  static String? ninImageId = data["user"]["driverLicenseImage"];
  static String? driverLicenseImage = data["user"]["driverLicenseImageId"];
  static bool? isCompletedRegistration =
      data["user"]["isCompletedRegistration"];
  static String? totalRevenue = data["totalRevenue"].toString();
}



