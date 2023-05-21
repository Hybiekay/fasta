import 'package:get/get.dart';
import 'package:ziklogistics/Dispatcher/views/meun_screen/comletes_Detail_screen.dart';
import '../../../controllers/controllers.dart';
import '../../../global_components/ziklogistics.dart';
import 'package:ziklogistics/Dispatcher/views/DispatcherH/history_card.dart';

class DispatcherCompletedlist extends StatelessWidget {
  const DispatcherCompletedlist({
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
          status: "completed",
        ),
        // initialData: InitialData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData && (snapshot.data["data"] as List).isEmpty) {
            return const NodataCard(
                content: "You don't Have Completed Request");
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
                return DispatcherHistoryCard(
                  isPaid: data["paymentStatus"] == "PAID",
                  continuePressed: () {},
                  chatPressed: () {},
                  trackPressed: () {
                    Get.to(() => DispatcherComleteTaskDetail(
                          height: data["height"].toString(),
                          width: data["width"].toString(),
                          name: data["name"],
                          size: data["size"].toString(),
                          weight: data["weight"].toString(),
                          dropOffAdress: data["dropoff_address"],
                          pickUpAdress: data["pickup_address"],
                          distance: data["distance"],
                          price: data["driverPrice"],
                          time: data["duration"],
                        ));
                  },
                  name: data['name'],
                  time: DateTime.parse(data['createdAt']),
                  track: "Completed Progress",
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
