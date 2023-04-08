// `import 'my_controller.dart';
// import 'package:get/get.dart';
// import 'package:flutter/material.dart';

// class MyHomePage extends StatelessWidget {
//   final MyController _myController = Get.put(MyController());

//   @override
//   Widget build(BuildContext context) {
//     // Assuming you have set the response value using _myController.setResponse(jsonString)
//     // where jsonString is the response data in JSON format
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('GetX Example'),
//       ),
//       body: Center(
//         child: GetBuilder<MyController>(
//           builder: (controller) {
//             // Access the response value from the controller
//             var response = controller.response.value;

//             // Use the response data in your UI
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text('Bound NE: ${response.boundNE}'),
//                 Text('Bound SW: ${response.boundSW}'),
//                 Text('Start Location Lat: ${response.startLocationLat}'),
//                 Text('Start Location Lon: ${response.startLocationLon}'),
//                 Text('End Location Lat: ${response.endLocationLat}
