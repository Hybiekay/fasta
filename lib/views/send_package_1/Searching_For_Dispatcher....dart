import 'package:get/get.dart';
import 'package:ziklogistics/global_components/ziklogistics.dart';
import 'package:ziklogistics/controllers/costomer_controller.dart';

class SearchingDispatcher extends StatefulWidget {
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
  static const String routeName = '/searchingDispatcher';

  const SearchingDispatcher(
      {super.key,
      required this.boundNe,
      required this.boundSw,
      required this.polyLine,
      required this.time,
      required this.packageId,
      required this.price,
      required this.distance,
      required this.discription,
      this.dateTime = "not Schedele",
      this.isSchedule = false,
      required this.pickUpLocation,
      required this.dropOffLocation});

  @override
  State<SearchingDispatcher> createState() => _SearchingDispatcherState();
}

class _SearchingDispatcherState extends State<SearchingDispatcher> {
  final CustomerController userController = Get.put(CustomerController());
  bool isFind = false;

  Future getDriver() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: Stack(
        children: [
          // image just for test
          Positioned(
            // child: Container(),
            child: GoogleMapPage(
                boundNe: widget.boundNe,
                boundSw: widget.boundSw,
                destricption: widget.discription,
                polyCoordinates:
                    PolylinePoints().decodePolyline(widget.polyLine),
                pickUpLocation: widget.pickUpLocation,
                dropOffLocation: widget.dropOffLocation),
          ),
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
              bottom: -5,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: widget.isSchedule
                    ? MediaQuery.of(context).size.height * 0.35
                    : MediaQuery.of(context).size.height * 0.28,
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
                        height: 12,
                      ),
                      isFind
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: UserCard(name: "Opeyemi Akinyemi"),
                            )
                          : Column(
                              children: const [
                                Text(
                                  "Searching for dispatcher...",
                                  style: TextStyle(
                                      color: AppColor.mainSecondryColor,
                                      fontFamily: 'DMSans',
                                      fontSize: 18,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w400,
                                      height: 1.5),
                                ),
                              ],
                            ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.whiteColor,
                        ),
                        child: Column(children: [
                          TotalItemBar(
                            distants: widget.distance,
                            amount: widget.price,
                            time: widget.time,
                          ),
                          widget.isSchedule
                              ? ScheduleButton(
                                  time: widget.dateTime,
                                )
                              : const SizedBox(
                                  height: 0,
                                ),
                        ]),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: isFind
                            ? ButtonComp(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ChoicePayment(
                                          packageId: " widget.packageId",
                                          distants: widget.distance,
                                          amount: widget.price,
                                          time: widget.time,
                                        ),
                                      ));
                                },
                                value: "Confirm")
                            : InActiveButtonComp(value: "Confirm"),
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

class ScheduleButton extends StatelessWidget {
  final String time;
  const ScheduleButton({
    required this.time,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      decoration: BoxDecoration(
        color: AppColor.mainColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.asset(AppImages.timeImage),
          Directionality(
            textDirection: TextDirection.rtl,
            child: TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_drop_down_sharp,
                color: AppColor.whiteColor,
              ),
              label: Text(time,
                  style: GoogleFonts.dmSans(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColor.whiteColor)),
            ),
          )
        ],
      ),
    );
  }
}
