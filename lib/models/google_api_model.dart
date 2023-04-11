class GoogleResponseModel {
  final Map<String, dynamic> boundNE;
  final Map<String, dynamic> boundSW;
  final double startLocationLat;
  final double startLocationLon;
  final double endLocationLat;
  final double endLocationLon;
  final String distance;
  final String duration;
  final dynamic polylineDecode;

  GoogleResponseModel({
    required this.boundNE,
    required this.boundSW,
    required this.startLocationLat,
    required this.startLocationLon,
    required this.endLocationLat,
    required this.endLocationLon,
    required this.distance,
    required this.duration,
    required this.polylineDecode,
  });
}
