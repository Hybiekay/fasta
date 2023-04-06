import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ziklogistics/models/drerition.dart';
import 'package:ziklogistics/global_components/ziklogistics.dart';

class GoogleApi {
  static Future<List?> getLocation({required String adress}) async {
    try {
      var locations = await locationFromAddress("Gronausestraat 710, Enschede");
      if (kDebugMode) {
        print("Latitude: ${locations.last.latitude}");
      }
      if (kDebugMode) {
        print("Longitude: ${locations.last.longitude}");
      }
      return locations;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }

  static Future getCorrenLocation() async {
    final getcurrentlocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    if (kDebugMode) {
      print("current location: $getcurrentlocation");
    }
    return getcurrentlocation;
  }

  static Future getdistane({
    required double startLat,
    required double startLng,
    required double endLat,
    required double endLng,
  }) async {
    try {
      final distanceInMeters =
          Geolocator.distanceBetween(startLat, startLng, endLat, endLng);
      double time = (distanceInMeters / 60) * 0.20;
      double dtime = (distanceInMeters / 1000) * 0.20;

      if (kDebugMode) {
        print("this is the distance $distanceInMeters");
      }

      return distanceInMeters;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<Directions?>? getPolyDirections(
      LatLng initialPosition, LatLng finalPosition) async {
    final getDirectionsUrl =
        'https://maps.googleapis.com/maps/api/directions/json?destination=${finalPosition.latitude},${finalPosition.longitude}&origin=${initialPosition.latitude},${initialPosition.longitude}&key=${AppApis.googlemapApi}';

    final response = await http.get(Uri.parse(getDirectionsUrl));
    final getDirectionsRequest = json.decode(response.body);
    if (getDirectionsRequest != null) {
      if (kDebugMode) {
        print(getDirectionsRequest);
      }
      if (getDirectionsRequest['status'] == "OK") {
        Directions directionsObject = Directions();
        directionsObject.encodedPoints =
            getDirectionsRequest['routes'][0]['overview_polyline']['points'];
        directionsObject.distanceText =
            getDirectionsRequest['routes'][0]['legs'][0]['distance']['text'];
        directionsObject.distanceValue =
            getDirectionsRequest['routes'][0]['legs'][0]['distance']['value'];
        directionsObject.durationText =
            getDirectionsRequest['routes'][0]['legs'][0]['duration']['text'];
        directionsObject.durationValue =
            getDirectionsRequest['routes'][0]['legs'][0]['duration']['value'];
        return directionsObject;
      }
    }
    return null;
  }
}
