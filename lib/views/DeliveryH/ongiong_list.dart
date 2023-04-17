import 'package:get/get.dart';
import '../../global_components/ziklogistics.dart';
import 'package:ziklogistics/chat/chat_screen.dart';
import 'package:ziklogistics/controllers/controllers.dart';
import 'package:ziklogistics/views/DeliveryH/history_card.dart';
import 'package:ziklogistics/views/meun_screen/meun_screen.dart';

class Ongoinglist extends StatelessWidget {
  const Ongoinglist({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CustomerController userController = Get.put(CustomerController());

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.72,
      width: MediaQuery.of(context).size.width * 0.85,
      child: FutureBuilder(
        future: userController.getHistory(
          status: "ongoing",
        ),
        // initialData: InitialData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData && (snapshot.data["data"] as List).isEmpty) {
            return const NodataCard(content: "You don't Have Ongoing Request");
          } else if (snapshot.hasData &&
              (snapshot.data["data"] as List).isNotEmpty) {
            if (kDebugMode) {
              print(snapshot.data);
            }
            return ListView.builder(
              reverse: true,
              itemCount: (snapshot.data["data"] as List).length,
              itemBuilder: (context, index) {
                final data = snapshot.data['data'][index];

                return HistoryCard(
                  continuePressed: () async {
                    if (data["acceptedDriverId"] == null) {
                      String token = await Storage.getToken();
                      Get.to(() => SearchingDispatcher(
                            token: token,
                            name: data["name"],
                            email: data["user"]["email"],
                            boundNe: data["pickup_object"]["boundNe"],
                            boundSw: data["pickup_object"]["boundSw"],
                            discription: data["description"],
                            distance: data["distance"],
                            packageId: data["id"],
                            dropOffLocation: LatLng(
                                double.parse(data["dropoff_lat"]),
                                double.parse(data["dropoff_lon"])),
                            pickUpLocation: LatLng(
                                double.parse(data["pickup_lat"]),
                                double.parse(data["pickup_lon"])),
                            polyLine: data["pickup_object"]["polyLine"] ?? '',
                            price: data["price"],
                            time: data["duration"],
                            dateTime:
                                " ${data["scheduled_date"]} ${data["scheduled_time"]}",
                            isSchedule: data["isScheduled"],
                          ));
                    } else if (data["paymentStatus"] == "PENDING") {
                      String token = await Storage.getToken();
                      Get.to(() => SearchingDispatcher(
                            token: token,
                            name: data["name"],
                            email: data["name"],
                            boundNe: data["pickup_object"]["boundNe"],
                            boundSw: data["pickup_object"]["boundSw"],
                            discription: data["description"],
                            distance: data["distance"],
                            packageId: data["id"],
                            dropOffLocation: LatLng(
                                double.parse(data["dropoff_lat"]),
                                double.parse(data["dropoff_lon"])),
                            pickUpLocation: LatLng(
                                double.parse(data["pickup_lat"]),
                                double.parse(data["pickup_lon"])),
                            polyLine: data["pickup_object"]["polyLine"] ?? '',
                            price: data["price"],
                            time: data["duration"],
                            dateTime:
                                " ${data["scheduled_date"]} ${data["scheduled_time"]}",
                            isSchedule: data["isScheduled"],
                          ));

                      // Get.off(() => CardChoice(
                      //       amount: data["price"],
                      //       distants: data["distance"],
                      //       email: data["user"]['email'],
                      //       packageId: data["id"],
                      //       time: data["duration"],
                      //       userName: data["name"],
                      //     ));
                    }
                  },
                  chatPressed: () async {
                    String token = await Storage.getToken();
                    if (data["acceptedDriverId"] != null) {
                      Get.to(() => ChatScreen(
                            senderEmail: data["user"]["email"],
                            senderName: data["name"],
                            receiverEmail: data["AcceptedDriver"]["email"],
                            receiverName: "${data["AcceptedDriver"]["name"]}",
                            token: token,
                          ));
                    } else {
                      Get.snackbar("Notice", "Get Driver first!");
                    }
                  },
                  trackPressed: () {
                    Get.to(() => MeunScreen(
                          status: data["status"],
                          discription: data["description"],
                          boundNe: data["pickup_object"]["boundNe"],
                          boundSw: data["pickup_object"]["boundSw"],
                          polyLine: data["pickup_object"]['polyLine'] ?? '',
                          width: "${data["width"]}",
                          height: "${data["height"]}",
                          name: data["name"],
                          size: data["size"].toString(),
                          weight: data["weight"].toString(),
                          dropOffAdress: data["dropoff_address"],
                          pickUpAdress: data["pickup_address"],
                          distance: data["distance"],
                          packageId: data["id"],
                          price: data["price"],
                          time: data["duration"],
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
          return const NodataCard(content: "Data Is loading Request");
        },
      ),
    );
  }
}
