import 'dart:convert';
import 'package:get/get.dart';
import '../../../chat/chat_screen.dart';
import 'package:ziklogistics/models/driver_model.dart';
import 'package:ziklogistics/controllers/controllers.dart';
import 'package:ziklogistics/global_components/ziklogistics.dart';
import 'package:ziklogistics/Dispatcher/views/meun_screen/meun_screen.dart';
import 'package:ziklogistics/Dispatcher/views/DispatcherH/history_card.dart';


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
          status: "ongoing",
        ),
        // initialData: InitialData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData && (snapshot.data["data"] as List).isEmpty) {
            return const NodataCard(content: "You don't Have Ongoing Request");
          } else if (snapshot.hasData &&
              (snapshot.data["data"] as List).isNotEmpty) {
            return ListView.builder(
              itemCount: (snapshot.data["data"] as List).length,
              itemBuilder: (context, index) {
                List<dynamic> dataList = snapshot.data['data'];

                dataList.sort((a, b) {
                  DateTime timeA = DateTime.parse(a['createdAt']);
                  DateTime timeB = DateTime.parse(b['createdAt']);
                  return timeB.compareTo(timeA);
                });
                final data = dataList[index];
                // String? paid;
                // if (data["paymentStatus"] == "PAID" &&
                //     data["paymentStatus"] != paid) {
                //   Notify.sendNotice(
                //       title: "Payment successful.",
                //       body:
                //           "The payment was successful. You can now chat with the customer for further updates.");

                //   // Update the acceptedDriverId variable with the new value

                //   paid = data["paymentStatus"];
                // }
                return DispatcherHistoryCard(
                  isPaid: data["paymentStatus"] == "PAID",
                  continuePressed: () {},
                  chatPressed: () async {
                    final driverdata = await DStorage.getDriverData();
                    final token = await DStorage.getDriverToken();
                    if (driverdata != null) {
                      driverData = json.decode(driverdata);
                    }

                    Get.to(() => ChatScreen(
                      email: DriverUserModel.email ??
                              data["AcceptedDriver"]['email'],
                            packageId: data["id"],
                          receiverEmail: data['user']['email'],
                          receiverName: data['user']['name'],
                          senderEmail: DriverUserModel.email ??
                              data["AcceptedDriver"]['email'],
                          senderName: DriverUserModel.name ??
                              data["AcceptedDriver"]['name'],
                          token: token,
                        ));
                  },
                  trackPressed: () {
                    Get.to(() => DispatcherMeunScreen(
                          height: "${data["height"]}",
                          width: "${data["width"]}",
                          pickUpAddress: data["pickup_address"],
                          dropOffAddress: data["dropoff_address"],
                          weight: "${data["weight"]}",
                          size: "${data["size"]}",
                          boundNe: data["pickup_object"]["boundNe"],
                          polyLine: data["pickup_object"]["polyLine"] ?? '',
                          boundSw: data["pickup_object"]["boundSw"],
                          name: data["name"],
                          distance: data["distance"],
                          packageId: data["id"],
                          price: data["price"],
                          time: data["duration"],
                          dropOffLocation: LatLng(
                              double.parse(data["dropoff_lat"]),
                              double.parse(data["dropoff_lon"])),
                          pickUpLocation: LatLng(
                            double.parse(data["pickup_lat"]),
                            double.parse(data["pickup_lon"]),
                          ),
                          discription: data["description"],
                          isSchedule: data["isScheduled"],
                          dateTime:
                              "${data["scheduled_date"]} ${data["scheduled_time"]}",
                        ));
                  },
                  name: data['name'],
                  time: DateTime.parse(data['createdAt']),
                  track: "Update Ongoing Progress",
                );
              },
            );
          }
          return const NodataCard(content: "Data Is loading Request");
        },
      ),
    );
  }
}
