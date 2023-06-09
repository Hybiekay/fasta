import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ziklogistics/Apis/Constant/api_conastants.dart';

// ignore: unused_import

class Location {
  static Future<Map<String, dynamic>> getdirection(
      {required String origin, required String destination}) async {
    final placeDetailsUrl = Uri.parse(
        "https://maps.googleapis.com/maps/api/directions/json?origin=$origin&destination=$destination&key=${AppApis.googlemapApi}");
    final detailsRequest = await http.get(placeDetailsUrl);

    var data = json.decode(detailsRequest.body);

    var result = {
      "bound_ne": data["routes"][0]["bounds"]["northeast"],
      "bound_sw": data["routes"][0]["bounds"]["southwest"],
      "start_location_lat": data["routes"][0]["legs"][0]["start_location"]
          ["lat"],
      "start_location_lng": data["routes"][0]["legs"][0]["start_location"]
          ["lng"],
      "end_location_lat": data["routes"][0]["legs"][0]["end_location"]['lat'],
      "end_location_lng": data["routes"][0]["legs"][0]["end_location"]['lng'],
      "polyline": data["routes"][0]["overview_polyline"]["points"],
      "distance": data['routes'][0]['legs'][0]['distance']["text"],
      "duration": data['routes'][0]['legs'][0]['duration']['text'],
      // "polyline_decode": PolylinePoints()
      //     .decodePolyline(data["routes"][0]["overview_polyline"]["points"])
    };

    return result;
  }
}
