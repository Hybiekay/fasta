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
        future: userController.getHistory(
          status: "completed",
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
                final data = snapshot.data[index];
                return HistoryCard(
                  trackPressed: () {
                    Navigator.of(context)
                        .pushNamed(ComleteTaskDetail.routeName);
                  },
                  name: data["name"],
                  time: "${data["createdAt"]}",
                  track: "Completed Progress",
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
