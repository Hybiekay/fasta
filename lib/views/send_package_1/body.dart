import 'dart:ui';
import 'package:get/get.dart';
import '../../Apis/google_api.dart';
import 'package:get/instance_manager.dart';
import 'package:ziklogistics/models/apiModel.dart';
import 'package:ziklogistics/models/customersModel.dart';
import 'package:ziklogistics/controllers/controllers.dart';
import 'package:ziklogistics/global_components/ziklogistics.dart';
import 'package:ziklogistics/views/send_package_1/getlocation.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

// ignore_for_file: use_build_context_synchronously

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final approxSizeController = TextEditingController();
    final approxWeightController = TextEditingController();
    final pickUpController = TextEditingController();
    final dropOffController = TextEditingController();
    final disController = TextEditingController();
    final widtController = TextEditingController();
    final lengthController = TextEditingController();
    final heightController = TextEditingController();
    var distance = '';
    var time = '';
    var boundNe = '';
    var boundSw = '';
    var polyLine = '';
    var startLocationLat = 0.0;
    var startLocationLon = 0.0;
    var endLocationLat = 0.0;
    var endLocationLon = 0.0;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.85,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    headerWidget(subTitle: 'Send A Package'),
                    SizedBox(height: 10.h),
                    Text(
                      'Input package details',
                      style: GoogleFonts.dmSans(
                        color: AppColor.whiteColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    InputPackagedetails(
                      onPressed: () {},
                      isSize: true,
                      val4: widtController,
                      val3: heightController,
                      val1: approxSizeController,
                      val2: approxWeightController,
                      desc1: 'Approx. Size',
                      textField3: "Height of the package",
                      textField4: "Width of the package",
                      img1: AppImages.packageImg,
                      textField1: 'Size of the package',
                      desc2: 'Approx. Weight',
                      img2: AppImages.packageImg,
                      textField2: 'Weight of the package',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Input location details',
                      style: GoogleFonts.dmSans(
                        color: AppColor.whiteColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    InputPackagedetails(
                        onPressed: () async {
                          var Response = await Location.getdirection(
                              origin: pickUpController.text,
                              destination: dropOffController.text);
                        },
                        textField3: "Drop-off location for the package",
                        textField4: "",
                        val3: dropOffController,
                        val4: dropOffController,
                        isSize: false,
                        val1: pickUpController,
                        val2: pickUpController,
                        desc1: 'Pickup',
                        img1: AppImages.pickUp,
                        textField1: 'Pickup location for the package',
                        desc2: 'Drop-off',
                        img2: AppImages.locatnImg,
                        textField2: 'Drop-off location for the package'),
                    SizedBox(
                      height: 8.h,
                    ),
                    GestureDetector(
                      onTap: () async {
                        var Response = await Location.getdirection(
                            origin: pickUpController.text,
                            destination: dropOffController.text);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: AppColor.whiteColor,
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.only(left: 12),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            onTap: () async {
                              response = await Location.getdirection(
                                  origin: pickUpController.text,
                                  destination: dropOffController.text);
                              double amount =
                                  (int.parse(approxWeightController.text) *
                                          double.parse(
                                              ApiMapModel.distance ?? "00")) *
                                      20;

                              print("this is Amount $amount");
                            },
                            autocorrect: true,
                            controller: disController,
                            maxLength: 1000,
                            maxLines: 4,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                                hintText: 'Description ',
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TotalItemBar(
                      amount: "99929299292",
                      distants: "${ApiMapModel.distance}",
                      time: "${ApiMapModel.time}",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Btubutton(
              polyLine: polyLine,
              boundNe: boundNe,
              boundSw: boundSw,
              distance: ApiMapModel.distance ?? " 0",
              duration: time,
              startLocationLat: ApiMapModel.startLocationLon ?? 0,
              startLocationLon: ApiMapModel.startLocationLat ?? 0,
              endLocationLat: ApiMapModel.endLocationLat ?? 0,
              endLocationLon: ApiMapModel.endLocationLon ?? 0,
              approxSizeController: approxSizeController,
              approxWeightController: approxWeightController,
              pickUpController: pickUpController,
              dropOffController: dropOffController,
              discriptionController: disController,
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ),
    );
  }
}

class Btubutton extends StatelessWidget {
  final String distance;
  final String duration;
  var boundNe;
  var boundSw;
  var polyLine;
  final double startLocationLat;
  final double startLocationLon;
  final double endLocationLat;
  final double endLocationLon;
  final TextEditingController approxSizeController;
  final TextEditingController approxWeightController;
  final TextEditingController pickUpController;
  final TextEditingController dropOffController;
  final TextEditingController discriptionController;
  Btubutton({
    Key? key,
    required this.distance,
    required this.duration,
    required this.boundNe,
    required this.boundSw,
    required this.polyLine,
    required this.startLocationLat,
    required this.startLocationLon,
    required this.endLocationLat,
    required this.endLocationLon,
    required this.approxSizeController,
    required this.approxWeightController,
    required this.pickUpController,
    required this.dropOffController,
    required this.discriptionController,
  }) : super(key: key);

  final CustomerController userController = Get.put(CustomerController());

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      GestureDetector(
        onTap: () {
          showDialog(
            barrierColor: AppColor.whiteColor.withOpacity(0.2),
            barrierDismissible: false,
            context: context,
            builder: (ctx) => BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 2.0,
                sigmaY: 2.0,
              ),
              child: ScheduleAlertDialog(
                userName: CustomersUserModel.name!,
                size: approxSizeController.text,
                width: approxWeightController.text,
                discription: discriptionController.text,
                pickupAdrress: pickUpController.text,
                dropoffAdress: dropOffController.text,
                isSchedule: true,
              ),
            ),
          );
        },
        child: Text(
          'Schedule',
          style: GoogleFonts.dmSans(
            color: AppColor.whiteColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      Spacer(),
      GestureDetector(
        onTap: () async {
          print(startLocationLat);
          print(startLocationLon);
          print(endLocationLon);
          print(endLocationLat);
          print(duration);
          print(distance);
          // var pickUpcoordinates =
          //     await GoogleApi.getLocation(adress: widget.pickUpController.text);
          // var dropOffcoordinates = await GoogleApi.getLocation(
          //     adress: widget.dropOffController.text);

          // double distance = await GoogleApi.getdistane(
          //     startLat: pickUpcoordinates!.last.latitude,
          //     startLng: pickUpcoordinates.last.longitude,
          //     endLat: dropOffcoordinates!.last.latitude,
          //     endLng: dropOffcoordinates.last.longitude);
          // double kg = distance / 1000;
          // double price =
          //     (int.parse(widget.approxSizeController.text) * kg * 15);
          // double time = 60 * kg / 60;
          // int totalPrice;
          // if (price < 500) {
          //   totalPrice = 500;
          // } else {
          //   totalPrice = price.toInt();
          // }

          // await userController.createPackage(
          //   weight: 0,
          //   height: 2,
          //   distance: "83", // kg.toInt().toString(),
          //   time: "82",
          //   size: 8, //int.parse(widget.approxSizeController.text),
          //   width: 10, //int.parse(widget.approxWeightController.text),
          //   price: "500", //totalPrice.toString(),
          //   userName: "My Name",
          //   pickupAdrress: widget.pickUpController.text,
          //   pickupLat:
          //       "4. 99111110", // pickUpcoordinates.last.latitude.toString(),
          //   pickupLon:
          //       "0032112000", //pickUpcoordinates.last.longitude.toString(),
          //   dropoffAdress: widget.dropOffController.text,
          //   dropoffLat:
          //       "78367187121", // dropOffcoordinates.last.latitude.toString(),
          //   dropoffLon:
          //       "78.367187121", // dropOffcoordinates.last.longitude.toString(),
          //   isSchedule: false,
          //   discription: widget.discriptionController.text,
          // );

          // Get.to(() => SearchingDispatcher(
          //       distance: "${kg.toInt()}",
          //       price: "${price.toInt()}",
          //       time: "$totalPrice",
          //       dLocation: LatLng(
          //         double.parse("${pickUpcoordinates.last.latitude}"),
          //         double.parse("${pickUpcoordinates.last.longitude}"),
          //       ),
          //       sLocation: LatLng(
          //         double.parse("${pickUpcoordinates.last.latitude}"),
          //         double.parse("${pickUpcoordinates.last.latitude}"),
          //       ),
          //     ));

          if (kDebugMode) {
            //  print(distance);
            print(approxSizeController.text);
            print(approxWeightController.text);
            print(pickUpController.text);
            print(dropOffController.text);
          }
        },
        child: Container(
          height: 45.h,
          width: 202.w,
          decoration: BoxDecoration(
            color: AppColor.whiteColor,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Center(
            child: Text(
              'Confirm',
              style: GoogleFonts.dmSans(
                color: AppColor.mainColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      )
    ]);
  }
}
