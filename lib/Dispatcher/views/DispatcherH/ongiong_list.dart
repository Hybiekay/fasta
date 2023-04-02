import 'package:get/get.dart';
import 'package:flutter/material.dart';
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
          if (snapshot.hasData) {
            print(snapshot.data);
            final data = snapshot.data;
            return ListView.builder(
              itemCount: snapshot.data["data"].length,
              itemBuilder: (context, index) {
                return HistoryCard(
                  trackPressed: () {
                    Navigator.of(context)
                        .pushNamed(DispatcherMeunScreen.routeName);
                  },
                  name: "",
                  time: "04.12.2021 • 20:30",
                  track: "Update Ongoing Progress",
                );
              },
            );
          }
          return NodataCard(content: "You don't Have Ongoing Request");
        },
      ),
    );
  }
}
