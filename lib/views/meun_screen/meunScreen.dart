import 'package:get/get.dart';
import 'package:ziklogistics/views/home/home.dart';
import 'package:ziklogistics/global_components/ziklogistics.dart';
import 'package:ziklogistics/views/meun_screen/comletes_Detail_screen.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

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
  const MeunScreen({
    Key? key,
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
  }) : super(key: key);

  @override
  State<MeunScreen> createState() => _MeunScreenState();
}

class _MeunScreenState extends State<MeunScreen> {
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
                    boundNe: {},
                    boundSw: {},
                    destricption: "",
                    dropOffLocation:
                        LatLng(widget.dropoffLat, widget.dropoffLon),
                    pickUpLocation: LatLng(widget.pickupLat, widget.pickupLon),
                    polyCoordinates: [],
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
                      const Text(
                        "Haven't started yet",
                        style: TextStyle(
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
                      TotalItemBar(
                          amount: widget.pickUpAdress,
                          distants: widget.distance,
                          time: widget.time),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
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
