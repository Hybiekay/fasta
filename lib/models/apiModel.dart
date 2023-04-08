import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class GoogleResponseModel {
  final Map<String, dynamic> boundNE;
  final Map<String, dynamic> boundSW;
  final double startLocationLat;
  final double startLocationLon;
  final double endLocationLat;
  final double endLocationLon;
  final String distance;
  final String duration;
  final List<Map<String, dynamic>> polylineDecode;

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
