import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../global_components/ziklogistics.dart';
import 'package:ziklogistics/views/DeliveryH/history_card.dart';
import 'package:ziklogistics/views/meun_screen/meunScreen.dart';
import 'package:ziklogistics/controllers/costomer_controller.dart';

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
          future: userController.getListOfDelivery(status: "ongoing"),
          // initialData: InitialData,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data["data"].length,
                itemBuilder: (context, index) {
                  return HistoryCard(
                    trackPressed: () {
                      Navigator.of(context).pushNamed(MeunScreen.routeName);
                    },
                    name: "Bosemide Akim",
                    time: "04.12.2021 • 20:30",
                    track: "Completed Successfully",
                  );
                },
              );
            }
            return const NodataCard(
                content: "No Ongoing Package \nMake Your New Request");
          },
        ));
  }
}
