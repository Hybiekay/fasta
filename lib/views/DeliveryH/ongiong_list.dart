import 'package:get/get.dart';
import '../../global_components/ziklogistics.dart';
import 'package:ziklogistics/chat/chat_screen.dart';
import 'package:ziklogistics/controllers/controllers.dart';
import 'package:ziklogistics/views/DeliveryH/history_card.dart';
import 'package:ziklogistics/views/meun_screen/meun_screen.dart';

class Ongoinglist extends StatefulWidget {
  const Ongoinglist({
    Key? key,
  }) : super(key: key);

  @override
  State<Ongoinglist> createState() => _OngoinglistState();
}

class _OngoinglistState extends State<Ongoinglist> {
  final CustomerController userController = Get.put(CustomerController());

  String? acceptedDriverId;
  @override
  Widget build(BuildContext context) {
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

                // if (data["acceptedDriverId"] != null &&
                //     data["acceptedDriverId"] != acceptedDriverId) {
                //   Notify.sendNotice(
                //       title:
                //           "Your package has been accecpted by${data["AcceptedDriver"]['name']}",
                //       body:
                //           "I have accepted to pick up your Goods kindly process to Pay, Or Now Chat with me for Updates");

                //   // Update the acceptedDriverId variable with the new value
                //   WidgetsBinding.instance.addPostFrameCallback((_) {
                //     setState(() {
                //       acceptedDriverId = data["acceptedDriverId"];
                //     });
                //     print(acceptedDriverId);
                //   });
                // } else if (data["acceptedDriverId"] == null &&
                //     acceptedDriverId != null) {
                //   Notify.sendNotice(
                //       title: "Sorry You Package Is Rejected By The Driver",
                //       body:
                //           "This happened because a technical issue occurred.  Await a new Dr");

                //   WidgetsBinding.instance.addPostFrameCallback((_) {
                //     setState(() {
                //       acceptedDriverId = null;
                //     });
                //   });
                // }

                return HistoryCard(
                  isPaid: data["acceptedDriverId"] != null &&
                      data["paymentStatus"] == "PAID",
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
