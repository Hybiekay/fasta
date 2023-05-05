import 'dart:developer';
import 'package:get/get.dart';
import 'package:ziklogistics/views/home/home.dart';
import 'package:ziklogistics/controllers/controllers.dart';
import 'package:ziklogistics/global_components/ziklogistics.dart';
import 'package:ziklogistics/views/meun_screen/comletes_detail_screen.dart';

// ignore_for_file: prefer_typing_uninitialized_variables

class MeunScreen extends StatefulWidget {
  static const String routeName = '/meunScreen';
  final String packageId;
  final String time;
  final String name;
  final String pickUpAdress;
  final String dropOffAdress;
  final String price;
  final String distance;
  final double pickupLat;
  final double pickupLon;
  final double dropoffLat;
  final double dropoffLon;
  final String size;
  final String weight;
  final String width;
  final String height;
  final boundNe;
  final boundSw;
  final String polyLine;
  final String discription;
  final String status;
  const MeunScreen(
      {Key? key,
      required this.packageId,
      required this.time,
      required this.name,
      required this.pickUpAdress,
      required this.dropOffAdress,
      required this.price,
      required this.distance,
      required this.pickupLat,
      required this.pickupLon,
      required this.dropoffLat,
      required this.dropoffLon,
      required this.size,
      required this.weight,
      required this.width,
      required this.height,
      required this.polyLine,
      required this.discription,
      this.boundNe,
      this.boundSw,
      this.status = "PENDING,"})
      : super(key: key);

  @override
  State<MeunScreen> createState() => _MeunScreenState();
}

class _MeunScreenState extends State<MeunScreen> {
  final CustomerController userController = Get.put(CustomerController());
  late Timer _timer;
  var status2;

  @override
  void initState() {
    startListeningToChanges();

    super.initState();
  }

  void startListeningToChanges() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      try {
        final res =
            await userController.getPackage(packageId: widget.packageId);

        if (res["status"] != "DELIVERED") {
          log("${res["acceptedDriverId"]} has data");
          setState(() {
            status2 = res["status"];
            print(status2);
            // isFind = true;
          });
        } else {
          _timer.cancel();
          log("${res["acceptedDriverId"]} has Nodata");
        }
      } catch (e) {
        // Handle any errors or exceptions that may occur during the API request
        log('Error: $e');
      }
    });
  }

  void stopListeningToChanges() {
    if (_timer.isActive) {
      _timer.cancel();
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    stopListeningToChanges();
    super.dispose();
  }

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
                  child: GoogleMapPage(
                    boundNe: widget.boundNe,
                    boundSw: widget.boundSw,
                    destricption: widget.discription,
                    dropOffLocation:
                        LatLng(widget.dropoffLat, widget.dropoffLon),
                    pickUpLocation: LatLng(widget.pickupLat, widget.pickupLon),
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
                  stopListeningToChanges();
                  Navigator.of(context).pop();
                },
              )),
            ),
          ),

          Positioned(
              bottom: -1,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.27,
                decoration: const BoxDecoration(
                    color: AppColor.mainColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        status2 == "PENDING"
                            ? "Haven't started yet"
                            : status2 == "ACCEPTED"
                                ? "Started and on it's way for pickup"
                                : status2 == "PICKUP"
                                    ? "Pickup done and on it's way for delivery"
                                    : status2 == "PICKUP" ?'Delivery done, request completed': "loading........",
                        style: const TextStyle(
                            color: AppColor.mainSecondryColor,
                            fontFamily: 'DMSans',
                            fontSize: 18,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w400,
                            height: 1.5),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TotalItemBar(
                            amount: widget.price,
                            distants: widget.distance,
                            time: widget.time),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Visibility(
                              visible:
                                  status2 != "PICKUP" && status2 != "DELIVERED",
                              child: TextButton(
                                  onPressed: () {
                                    mainshowDialod(
                                      context: context,
                                      value:
                                          'Your request has been cancelled successfully',
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushReplacementNamed(
                                                CostomerHome.routeName);
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
                                    Get.to(() => ComleteTaskDetail(
                                          width: widget.width,
                                          height: widget.height,
                                          name: widget.name,
                                          size: widget.size,
                                          weight: widget.weight,
                                          time: widget.time,
                                          price: widget.price,
                                          pickUpAdress: widget.pickUpAdress,
                                          distance: widget.distance,
                                          dropOffAdress: widget.dropOffAdress,
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
