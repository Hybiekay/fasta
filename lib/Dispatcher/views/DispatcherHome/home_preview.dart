import 'package:get/get.dart';
import 'package:ziklogistics/Dispatcher/views/DispatcherHome/Dis_Request_card.dart';
import '../../../controllers/controllers.dart';
import 'package:ziklogistics/global_components/ziklogistics.dart';
import 'package:ziklogistics/Dispatcher/views/Dispatcherdrawer/drawer.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

class PrivewHome extends StatefulWidget {
  final String name;
  final String distance;
  final String time;
  final String price;
  final String size;
  final String withe;
  final String pickUp;
  final String dropOff;
  final String scheduleTime;
  final bool isScahedule;
  final String packageId;
  const PrivewHome({
    Key? key,
    required this.name,
    required this.distance,
    required this.time,
    required this.price,
    required this.size,
    required this.withe,
    required this.pickUp,
    required this.dropOff,
    required this.scheduleTime,
    required this.isScahedule,
    required this.packageId,
  }) : super(key: key);

  @override
  State<PrivewHome> createState() => _PrivewHomeState();
}

class _PrivewHomeState extends State<PrivewHome> {
  DriverController driverController = Get.put(DriverController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
            child: FutureBuilder(
                future: driverController.getSingleRequest(widget.packageId),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return DispatcherRequsetCard(
                      name: widget.name,
                      size: widget.size,
                      price: widget.price,
                      distance: widget.distance,
                      dropOff: widget.dropOff,
                      pickUp: widget.pickUp,
                      withe: widget.withe,
                      isScahedule: widget.isScahedule,
                      time: widget.time,
                      scheduleTime: widget.scheduleTime,
                      packAgeId: widget.packageId,
                    );
                  }
                  return Container(); //dispatcherRequsetCard();
                }),
          ))
        ],
      ),
    );
  }
}
