import 'package:flutter/material.dart';
import 'package:ziklogistics/constants/appocolor.dart';

class ChatScreen extends StatelessWidget {
  static const String routeName = '/chatScreen';
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: false,
          titleSpacing: 0,
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.arrow_back_ios)),
          backgroundColor: AppColor.mainColor,
          title: const Text(
            "Bosemide Akim",
          ),
          actions: const [
            Icon(Icons.search),
            Icon(Icons.more_vert),
          ]),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: AppColor.backgroundsecondary,
        child: Column(
          children: [
            Expanded(
              child: Container(),
            ),
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              color: AppColor.mainColor,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.add,
                        color: AppColor.whiteColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            color: AppColor.whiteColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            maxLines: 3,
                            minLines: 1,
                            decoration: InputDecoration(
                                hintText: "Write your message",
                                border: InputBorder.none),
                          ),
                        )),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Icon(
                      Icons.send_sharp,
                      color: AppColor.whiteColor,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
