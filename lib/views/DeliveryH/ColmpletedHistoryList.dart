import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../controllers/controllers.dart';
import 'package:ziklogistics/views/DeliveryH/history_card.dart';
import 'package:ziklogistics/global_components/no_data_card.dart';
import 'package:ziklogistics/views/meun_screen/comletes_Detail_screen.dart';

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
        future: userController.getListOfDelivery(status: "completed"),
        // initialData: InitialData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data["data"].length,
              itemBuilder: (context, index) {
                return HistoryCard(
                  trackPressed: () {
                    Navigator.of(context)
                        .pushNamed(ComleteTaskDetail.routeName);
                  },
                  name: "Bosemide Akim",
                  time: "04.12.2021 • 20:30",
                  track: "Completed Successfully",
                );
              },
            );
          }
          return NodataCard(content: "No Complete Package");
        },
      ),
    );
  }
}
