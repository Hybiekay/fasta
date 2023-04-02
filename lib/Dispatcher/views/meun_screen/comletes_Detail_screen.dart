import 'package:flutter/material.dart';
import 'package:ziklogistics/constants/appImages.dart';
import 'package:ziklogistics/constants/appocolor.dart';
import 'package:ziklogistics/global_components/packAgePreviwe.dart';
import 'package:ziklogistics/global_components/total_item_bar_comp.dart';

class DispatcherComleteTaskDetail extends StatefulWidget {
  static const String routeName = '/comleteTaskDetail';
  const DispatcherComleteTaskDetail({super.key});

  @override
  State<DispatcherComleteTaskDetail> createState() =>
      _DispatcherComleteTaskDetailState();
}

class _DispatcherComleteTaskDetailState
    extends State<DispatcherComleteTaskDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: Stack(
        children: [
          // image just for test
          Positioned(
              child: Container(
            color: Colors.amber,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              AppImages.map,
              fit: BoxFit.fill,
            ),
          )),

          Positioned(
            top: 50,
            left: 30,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColor.mainColor),
              child: Center(
                  child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 17,
                  color: AppColor.whiteColor,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )),
            ),
          ),

          Positioned(
              bottom: -4,
              child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.80,
                  decoration: const BoxDecoration(
                      color: AppColor.mainColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const PackagedetailsSize(),
                      const SizedBox(
                        height: 20,
                      ),
                      const Packagedetailslocation(),
                      const SizedBox(
                        height: 15,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 35),
                        child: TotalItemBar(amount: '', time: '', distants: ''),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 35),
                        alignment: Alignment.bottomRight,
                        child: SizedBox(
                          width: 200,
                          height: 50,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.whiteColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () {},
                              child: const Text("Details",
                                  style: TextStyle(
                                      color: AppColor.mainColor,
                                      fontFamily: 'DMSans',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      height: 1.5))),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
