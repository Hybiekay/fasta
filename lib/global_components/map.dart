import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ziklogistics/constants/app_color.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// ignore_for_file: prefer_typing_uninitialized_variables


class GoogleMapPage extends StatefulWidget {
  GoogleMapPage({
    super.key,
    required this.polyCoordinates,
    required this.pickUpLocation,
    required this.dropOffLocation,
    required this.destricption,
    required this.boundNe,
    required this.boundSw,
  });

  final List<PointLatLng> polyCoordinates;
  final LatLng dropOffLocation;
  final LatLng pickUpLocation;
  final String destricption;
  var boundNe;
  var boundSw;

  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Polyline> _polyLine = Set<Polyline>();

  int _polyLineIdCounter = 1;

  void _setPolyLine(List<PointLatLng> points) {
    final String polyLineIdVal = "polyline_$_polyLineIdCounter";
    _polyLineIdCounter++;
    _polyLine.add(Polyline(
        polylineId: PolylineId(polyLineIdVal),
        width: 2,
        color: AppColor.mainColor,
        points: points
            .map(
              (point) => LatLng(point.latitude, point.longitude),
            )
            .toList()));
  }

  @override
  void initState() {
    _setPolyLine(widget.polyCoordinates);
    goToPlace(
        Slat: widget.dropOffLocation,
        boundNe: widget.boundNe,
        boundSw: widget.boundSw);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        initialCameraPosition: CameraPosition(
          bearing: 2,
          target: widget.dropOffLocation,
          zoom: 10,
        ),
        polylines: _polyLine,
        markers: {
          Marker(
              markerId: const MarkerId("Pick Up"),
              position: widget.pickUpLocation,
              infoWindow: InfoWindow(
                  title: "Pick Up Area", snippet: widget.destricption)),
          Marker(
            markerId: const MarkerId("Drop Off"),
            position: widget.dropOffLocation,
            infoWindow: const InfoWindow(title: "Drop Off"),
          ),
        },
      ),
    );
  }

  Future<void> goToPlace({
    var Slat,
    required Map<String, dynamic> boundSw,
    required Map<String, dynamic> boundNe,
  }) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
        CameraUpdate.newCameraPosition(CameraPosition(target: Slat, zoom: 12)));

    controller.animateCamera(CameraUpdate.newLatLngBounds(
        LatLngBounds(
          southwest: LatLng(boundSw['lat'], boundSw['lng']),
          northeast: LatLng(boundNe['lat'], boundNe['lng']),
        ),
        25));
  }
}
