import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../chat/chatScreen.dart';
import '../../../controllers/drivers_controller.dart';
import 'package:ziklogistics/views/DeliveryH/history_card.dart';
import 'package:ziklogistics/global_components/ziklogistics.dart';
import 'package:ziklogistics/Dispatcher/views/meun_screen/meunScreen.dart';

class DispatcherOngoinglist extends StatelessWidget {
  const DispatcherOngoinglist({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DriverController driverController = Get.put(DriverController());
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.72,
      width: MediaQuery.of(context).size.width * 0.85,
      child: FutureBuilder(
        future: driverController.getHistory(
          "ongoing",
        ),
        // initialData: InitialData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData && (snapshot.data["data"] as List).length < 1) {
            return NodataCard(content: "You don't Have Ongoing Request");
          } else if (snapshot.hasData &&
              (snapshot.data["data"] as List).length >= 1) {
            print(snapshot.data);
            return ListView.builder(
              itemCount: (snapshot.data["data"] as List).length,
              itemBuilder: (context, index) {
                final data = snapshot.data['data'][index];

                return HistoryCard(
                  chatPressed: () {
                    Get.to(() => ChatScreen());
                  },
                  trackPressed: () {
                    Get.to(() => DispatcherMeunScreen(
                          name: data["name"],
                          size: data["size"].toString(),
                          weight: data["weight"].toString(),
                          dropOffAdress: data["dropoff_address"],
                          pickUpAdress: data["pickup_address"],
                          distance: data["dropoff_object"],
                          packageId: data["id"],
                          price: data["price"],
                          time: data["pickup_object"],
                          pickupLon: double.parse(data["pickup_lon"]),
                          pickupLat: double.parse(data["pickup_lat"]),
                          dropoffLon: double.parse(data["dropoff_lon"]),
                          dropoffLat: double.parse(data["dropoff_lat"]),
                        ));
                  },
                  name: data['name'],
                  time: DateTime.parse(data['createdAt']),
                  track: "Update Ongoing Progress",
                );
              },
            );
          }
          return NodataCard(content: "Data Is loading Request");
        },
      ),
    );
  }
}
