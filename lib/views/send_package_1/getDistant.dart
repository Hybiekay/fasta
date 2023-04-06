import 'package:ziklogistics/views/send_package_1/getlocation.dart';
// ignore_for_file: fil

class PackagePro {
  var distance;
  var price;
  var pickUpcoordinates;
  var dropOffcoordinates;
  // late double distance;
}

getDistance({
  required String pickUpAdress,
  required String dropOfpAdress,
  required String size,
}) async {
  var pickUpcoordinates = await GoogleApi.getLocation(adress: pickUpAdress);
  var dropOffcoordinates = await GoogleApi.getLocation(adress: dropOfpAdress);

  double distance = await GoogleApi.getdistane(
      startLat: pickUpcoordinates!.last.latitude,
      startLng: pickUpcoordinates.last.longitude,
      endLat: dropOffcoordinates!.last.latitude,
      endLng: dropOffcoordinates.last.longitude);
  double kg = distance / 1000;
  double price = (int.parse(size) * kg * 15);
  double time = 60 * kg / 60;
  int totalPrice;
  if (price < 500) {
    totalPrice = 500;
  } else {
    totalPrice = price.toInt();
  }
}
