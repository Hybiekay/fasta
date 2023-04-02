import 'package:flutter/material.dart';
import 'package:ziklogistics/constants/appocolor.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatelessWidget {
  const Map({
    super.key,
    required this.polyCoordinates,
    required this.sourceLoaction,
    required this.destinationLoaction,
  });

  final List<LatLng> polyCoordinates;
  final LatLng sourceLoaction;
  final LatLng destinationLoaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          bearing: 2,
          target: sourceLoaction,
          zoom: 5,
        ),
        polylines: {
          Polyline(
              visible: true,
              polylineId: const PolylineId("route"),
              points: polyCoordinates,
              color: AppColor.mainColor,
              width: 3)
        },
        markers: {
          
          Marker(
            markerId: const MarkerId("source"),
            position: sourceLoaction,
          ),
          Marker(
              markerId: const MarkerId("destination"),
              position: destinationLoaction)
        },
      ),
    );
  }
}
