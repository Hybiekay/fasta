import 'dart:convert';
import 'package:get/get.dart';
import 'package:ziklogistics/models/apiModel.dart';

class MyController extends GetxController {
  Rx<GoogleResponseModel> response = GoogleResponseModel(
    boundNE: {},
    boundSW: {},
    startLocationLat: 0.0,
    startLocationLon: 0.0,
    endLocationLat: 0.0,
    endLocationLon: 0.0,
    distance: "",
    duration: "",
    polylineDecode: [],
  ).obs;

  void setResponse(String jsonString) {
    final decodedJson = json.decode(jsonString);

    final boundNE = decodedJson['bound_ne'];
    final boundSW = decodedJson['bound_sw'];
    final startLocationLat = decodedJson['start_location_lat'];
    final startLocationLon = decodedJson['start_location_lon'];
    final endLocationLat = decodedJson['end_location_lat'];
    final endLocationLon = decodedJson['end_location_lon'];
    final distance = decodedJson['distance'];
    final duration = decodedJson['duration'];
    final polylineDecode = decodedJson['polyline_decode'];

    response.value = GoogleResponseModel(
      boundNE: boundNE,
      boundSW: boundSW,
      startLocationLat: startLocationLat,
      startLocationLon: startLocationLon,
      endLocationLat: endLocationLat,
      endLocationLon: endLocationLon,
      distance: distance,
      duration: duration,
      polylineDecode: polylineDecode,
    );
  }
}
