import 'package:get/get.dart';
import 'package:ziklogistics/controllers/controllers.dart';
import 'package:ziklogistics/global_components/ziklogistics.dart';
import 'package:ziklogistics/Dispatcher/views/DispatcherHome/home.dart';
import 'package:ziklogistics/Dispatcher/views/meun_screen/comletes_detail_screen.dart';
// ignore_for_file: prefer_typing_uninitialized_variables

class DispatcherMeunScreen extends StatefulWidget {
  static const String routeName = '/DispatchermeunScreen';
  final String price;
  final String time;
  final String distance;
  final String discription;
  final LatLng pickUpLocation;
  final LatLng dropOffLocation;
  final bool isSchedule;
  final String dateTime;
  final String packageId;
  final boundNe;
  final boundSw;
  final String polyLine;
  final String name;
  final String size;
  final String weight;
  final String pickUpAddress;
  final String dropOffAddress;
  final String width;
  final String height;

  const DispatcherMeunScreen({
    Key? key,
    required this.boundNe,
    required this.boundSw,
    required this.price,
    required this.time,
    required this.distance,
    required this.discription,
    required this.pickUpLocation,
    required this.dropOffLocation,
    required this.isSchedule,
    required this.dateTime,
    required this.packageId,
    required this.polyLine,
    required this.name,
    required this.size,
    required this.weight,
    required this.pickUpAddress,
    required this.dropOffAddress,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  State<DispatcherMeunScreen> createState() => _DispatcherMeunScreenState();
}

class _DispatcherMeunScreenState extends State<DispatcherMeunScreen> {
  DriverController driverController = Get.put(DriverController());

  String dropDownvalue = "PENDING";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(42, 28, 55, 56),
      body: Stack(
        children: [
          // image just for test

          Positioned(
              child: Container(
                  color: Colors.amber,
                  width: MediaQuery.of(context).size.width,
                  child: GoogleMapPage(
                    boundNe: widget.boundNe,
                    boundSw: widget.boundNe,
                    destricption: widget.distance,
                    dropOffLocation: widget.dropOffLocation,
                    pickUpLocation: widget.pickUpLocation,
                    polyCoordinates:
                        PolylinePoints().decodePolyline(widget.polyLine),
                  ))),

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
                  Navigator.of(context).pop();
                },
              )),
            ),
          ),

          Positioned(
              bottom: -5,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.28,
                decoration: const BoxDecoration(
                    color: AppColor.mainColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.mainSecondryColor),
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          child: DropdownButtonFormField(
                              borderRadius: BorderRadius.circular(20),
                              alignment: Alignment.center,
                              value: dropDownvalue,
                              onTap: () {},
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                              icon: const Icon(Icons.arrow_drop_down_outlined),
                              dropdownColor: AppColor.mainSecondryColor,
                              items: [
                                DropdownMenuItem(
                                  value: "PENDING",
                                  onTap: (() {
                                    setState(() {});
                                  }),
                                  child: const Center(
                                    child: Text(
                                      "Haven't started yet",
                                      style: TextStyle(
                                          color: AppColor.whiteColor,
                                          fontFamily: 'DMSans',
                                          fontSize: 18,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.w700,
                                          height: 1.5),
                                    ),
                                  ),
                                ),
                                const DropdownMenuItem(
                                  value: "ACCEPTED",
                                  child: Center(
                                    child: Text(
                                      "Started and on it's way for pickup",
                                      style: TextStyle(
                                          color: AppColor.whiteColor,
                                          fontFamily: 'DMSans',
                                          fontSize: 16,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.w700,
                                          height: 1.5),
                                    ),
                                  ),
                                ),
                                const DropdownMenuItem(
                                  value: "PICKUP",
                                  child: Center(
                                    child: Text(
                                      " Pickup done and on it's way for delivery",
                                      style: TextStyle(
                                          color: AppColor.whiteColor,
                                          fontFamily: 'DMSans',
                                          fontSize: 16,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.w700,
                                          height: 1.5),
                                    ),
                                  ),
                                ),
                                const DropdownMenuItem(
                                  value: "COMPLETED",
                                  child: Center(
                                    child: Text(
                                      " Delivery done, request completed",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: AppColor.whiteColor,
                                          fontFamily: 'DMSans',
                                          fontSize: 16,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.w600,
                                          height: 1.5),
                                    ),
                                  ),
                                ),
                              ],
                              onChanged: (v) async {
                                setState(() {
                                  dropDownvalue = v!;
                                });
                                await driverController.changePackageStatus(
                                    packageId: widget.packageId,
                                    status: dropDownvalue);
                              })),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TotalItemBar(
                          amount: widget.price,
                          distants: widget.distance,
                          time: widget.time,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 11),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Visibility(
                              visible: dropDownvalue == "PENDING" ||
                                  dropDownvalue == "ACCEPTED",
                              child: TextButton(
                                  onPressed: () {
                                    mainshowDialod(
                                      context: context,
                                      value:
                                          'Your request has been cancelled successfully',
                                      onPressed: () async {
                                        await driverController.rejectPackage(
                                            packageId: widget.packageId);
                                        Get.to(() => DispatcherHome.routeName);
                                      },
                                    );
                                  },
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(
                                        color: AppColor.whiteColor,
                                        fontFamily: 'DMSans',
                                        fontSize: 20,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w700,
                                        height: 1.5),
                                  )),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              width: 200,
                              height: 50,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColor.whiteColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  onPressed: () {
                                    Get.to(() => DispatcherComleteTaskDetail(
                                          height: widget.height,
                                          width: widget.width,
                                          name: widget.name,
                                          size: widget.size,
                                          weight: widget.weight,
                                          time: widget.time,
                                          price: widget.price,
                                          pickUpAdress: widget.pickUpAddress,
                                          distance: widget.distance,
                                          dropOffAdress: widget.dropOffAddress,
                                        ));
                                  },
                                  child: const Text("Details",
                                      style: TextStyle(
                                          color: AppColor.mainColor,
                                          fontFamily: 'DMSans',
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          height: 1.5))),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
