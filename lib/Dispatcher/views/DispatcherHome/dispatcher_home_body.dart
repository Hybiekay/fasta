import 'request-card.dart';
import 'package:get/get.dart';
import '../../../controllers/controllers.dart';
import 'package:ziklogistics/global_components/ziklogistics.dart';
import 'package:ziklogistics/Dispatcher/views/Dispatcherdrawer/drawer.dart';
import 'package:ziklogistics/Dispatcher/views/DispatcherHome/homePreview.dart';
import 'package:ziklogistics/Dispatcher/views/DispatcherHome/Dis_Request_card.dart';

class DispatcherHomeBody extends StatefulWidget {
  const DispatcherHomeBody({super.key});

  @override
  State<DispatcherHomeBody> createState() => _DispatcherHomeBodyState();
}

class _DispatcherHomeBodyState extends State<DispatcherHomeBody> {
  DriverController driverController = Get.put(DriverController());
  bool isrequested = false;

  @override
  void initState() {
    super.initState();
    requs();
  }

//Texting pupose the Screen need to wait for 5seconds before moving to another screen if not the Screen is going to crash
  requs() {
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        isrequested = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width.w,
          height: MediaQuery.of(context).size.height * 0.32,
          color: AppColor.whiteColor,
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const DispatcherDrawerScreen());
                      //   Navigator.of(context)
                      //       .pushNamed(DispatcherDrawerScreen.routeName);
                    },
                    child: Image.asset(
                      AppImages.menuBar,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Your Dispatch Request',
                    style: GoogleFonts.dmSans(
                      color: AppColor.mainColor,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    'Get it delivered in the time it takes to drive there!',
                    style: GoogleFonts.dmSans(
                      color: AppColor.mainColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          )),
        ),
        Expanded(
            child: Container(
          height: MediaQuery.of(context).size.height * 0.68.h,
          color: AppColor.mainColor,
          child: FutureBuilder<List<dynamic>>(
              future: driverController.getAllRequest(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData && snapshot.data.length < 1) {
                  return const NodataCard(content: "You have No Request \nyet");
                } else if (snapshot.hasData && snapshot.data.length >= 1) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      final item = snapshot.data![index];
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => PrivewHome(
                                name: item["name"].toString(),
                                price: item["price"].toString(),
                                time: item["dropoff_object"].toString(),
                                distance: item["dropoff_object"].toString(),
                                size: item["size"].toString(),
                                withe: item["width"].toString(),
                                pickUp: item["pickup_address"],
                                dropOff: item["dropoff_address"],
                                isScahedule: false,
                                scheduleTime:
                                    "${item["scheduled_date"]} ${item["scheduled_time"]}",
                                packageId: item["id"],
                              ));
                        },
                        child: RequestCard(
                          name: item["name"],
                          price: item["price"],
                          time: item["dropoff_object"] ?? '20',
                          distance: item["dropoff_object"] ?? "82",
                        ),
                      );
                    },
                  );
                }
                return NodataCard(content: "You have No Request \nyet");
              }),
        ))
      ],
    );
  }
}
