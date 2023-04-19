import 'package:get/get.dart';
import '../../controllers/controllers.dart';
import '../../global_components/ziklogistics.dart';
import 'package:ziklogistics/views/DeliveryH/history_card.dart';
import 'package:ziklogistics/views/meun_screen/comletes_detail_screen.dart';

class Completedlist extends StatelessWidget {
  const Completedlist({
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
          status: "completed",
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
              itemCount: (snapshot.data["data"] as List).length,
              itemBuilder: (context, index) {
                final data = snapshot.data['data'][index];

                return HistoryCard(
                  isPaid: data["acceptedDriverId"] != null ||
                      data["paymentStatus"] == "PAID",
                  continuePressed: () async {},
                  chatPressed: () {},
                  trackPressed: () {
                    Get.to(() => ComleteTaskDetail(
                          // status: data["status"],
                          // discription: data["description"],
                          // boundNe: data["pickup_object"]["boundNe"],
                          // boundSw: data["pickup_object"]["boundSw"],
                          // polyLine: data["pickup_object"]['polyLine'] ?? '',
                          width: "${data["width"]}",
                          height: "${data["height"]}",
                          name: data["name"],
                          size: data["size"].toString(),
                          weight: data["weight"].toString(),
                          dropOffAdress: data["dropoff_address"],
                          pickUpAdress: data["pickup_address"],
                          distance: data["distance"],
                          // packageId: data["id"],
                          price: data["price"],
                          time: data["duration"],
                          // pickupLon: double.parse(data["pickup_lon"]),
                          // pickupLat: double.parse(data["pickup_lat"]),
                          // dropoffLon: double.parse(data["dropoff_lon"]),
                          // dropoffLat: double.parse(data["dropoff_lat"]),
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
