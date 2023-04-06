var response;

class ApiMapModel {
  static double? startLocationLon = response["start_location"]['lon'];
  static double? startLocationLat = response["start_location"]["lat"];
  static double? endLocationLat = response["end_location"]["lat"];
  static double? endLocationLon = response["end_location"]["lat"];
  static var boundNe = response["bound_ne"];
  static var boundSw = response["bound_sw"];
  static String? distance = response["distance"];
  static String? time = response["duration"];
  static var polyLine = response["duration"];
}
