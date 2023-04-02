import 'package:ziklogistics/global_components/ziklogistics.dart';
import 'package:ziklogistics/Dispatcher/views/DispatcherHome/home.dart';
import 'package:ziklogistics/Dispatcher/views/meun_screen/comletes_Detail_screen.dart';



class DispatcherMeunScreen extends StatefulWidget {
  static const String routeName = '/DispatchermeunScreen';
  const DispatcherMeunScreen({super.key});

  @override
  State<DispatcherMeunScreen> createState() => _DispatcherMeunScreenState();
}

class _DispatcherMeunScreenState extends State<DispatcherMeunScreen> {
  String dropDownvalue = "Haven't started yet";
  static const LatLng sourceLoaction = LatLng(7.1864, 3.4331);
  static const LatLng destinationLoaction = LatLng(7.2235, 3.4403);

  List<LatLng> polyCoordinates = [];

  void getPolyPoint() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      AppApis.googlemapApi,
      PointLatLng(sourceLoaction.longitude, sourceLoaction.longitude),
      PointLatLng(
        destinationLoaction.latitude,
        destinationLoaction.longitude,
      ),
    );

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        setState(() {
          polyCoordinates.add(
            LatLng(point.latitude, point.longitude),
          );
        });
      }
      setState(() {});
    }
  }

  @override
  void initState() {
    getPolyPoint();

    super.initState();
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
                  child: Map(
                    destinationLoaction: destinationLoaction,
                    sourceLoaction: sourceLoaction,
                    polyCoordinates: polyCoordinates,
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
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                          icon: const Icon(Icons.arrow_drop_down_outlined),
                          dropdownColor: AppColor.mainSecondryColor,
                          items: [
                            DropdownMenuItem(
                              value: "Haven't started yet",
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
                              value: "Started and on it's way for pickup",
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
                              value:
                                  "Pickup done and on it's way for delivery",
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
                              value: "Delivery done, request completed",
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
                          onChanged: (v) {})





























                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const TotalItemBar(amount: '', distants: '', time: ''),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 11),
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
                                              DispatcherHome.routeName);
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
                                    Navigator.of(context).pushNamed(
                                        DispatcherComleteTaskDetail.routeName);
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
