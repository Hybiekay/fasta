import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../controllers/controllers.dart';
import '../../../global_components/ziklogistics.dart';
import 'package:ziklogistics/views/DeliveryH/history_card.dart';
import 'package:ziklogistics/Dispatcher/views/meun_screen/comletes_Detail_screen.dart';

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
          future: driverController.getHistory("completed"),
          // initialData: InitialData,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print(snapshot.data);

            if (snapshot.data["data"].toList < 1 && snapshot.data) {
              return NodataCard(
                content: "You have not completed request \nyet!",
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data["data"].length,
                itemBuilder: (context, index) {
                  return HistoryCard(
                    trackPressed: () {
                      Navigator.of(context)
                          .pushNamed(DispatcherComleteTaskDetail.routeName);
                    },
                    name: "Suwebayt Opemipo",
                    time: "04.12.2021 • 20:30",
                    track: "Completed Successfully",
                  );
                },
              );
            }
            return NodataCard(
              content: "You have not completed request \nyet!",
            );
          }),
    );
  }
}
