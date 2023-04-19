import 'dart:ui';
import 'package:get/get.dart';
import '../../Apis/google_api.dart';
import 'package:ziklogistics/models/customers_model.dart';
import 'package:ziklogistics/controllers/controllers.dart';
import 'package:ziklogistics/global_components/ziklogistics.dart';
// ignore_for_file: prefer_typing_uninitialized_variables

// ignore_for_file: public_member_api_docs, sort_constructors_first

// ignore_for_file: use_build_context_synchronously

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final approxSizeController = TextEditingController();
  final approxWeightController = TextEditingController();
  final pickUpController = TextEditingController();
  final dropOffController = TextEditingController();
  final disController = TextEditingController();
  final widtController = TextEditingController();
  final heightController = TextEditingController();

  var distance = '';
  var duration = '';
  var time = '';
  var boundNe = {};
  var boundSw  = {};
  var polyLine = '';
  var startLocationLat = 0.0;
  var startLocationLng = 0.0;
  var endLocationLat = 0.0;
  var endLocationLng = 0.0;
  var amount = 0;
  getd() async {
    var res = await Location.getdirection(
        origin: pickUpController.text, destination: dropOffController.text);
    String distanceInt =
        await res["distance"].substring(0, res["distance"].length - 2);
    double payment =
        (int.parse(approxWeightController.text) * double.parse(distanceInt)) *
            20;
    if (kDebugMode) {
      print("this is endlat ${res["end_location_lat"]}");
    }
    if (payment < 500) {
      setState(() {
        amount = 500;
      });
    } else {
      setState(() {
        amount = payment.toInt();
      });
    }

    setState(() {
      duration = res["duration"];
      distance = res["distance"];
      boundNe = res["bound_ne"];
      startLocationLat = res["start_location_lat"];
      startLocationLng = res["start_location_lng"];
      endLocationLat = res["end_location_lat"];
      endLocationLng = res["end_location_lng"];
      polyLine = res["polyline"];
      boundSw = res["bound_sw"];
    });

    if (kDebugMode) {
      print("this startLat $startLocationLat");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: SingleChildScrollView(
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
                      HeaderWidget(subTitle: 'Send A Package', onPressed: () {
                        
                      },),
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
                        keyboardType: TextInputType.number,
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
                          onPressed: getd,
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
                        onTap: () {
                          if (kDebugMode) {
                            print(time);
                          }
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
                              onTap: getd,
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
                      GestureDetector(
                        onTap: () {
                          if (kDebugMode) {
                            print(time);
                          }
                        },
                        child: TotalItemBar(
                          amount: " $amount",
                          distants: distance,
                          time: duration,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Btubutton(
                heightController: heightController,
                widthController: widtController,
                amount: amount,
                polyLine: polyLine,
                boundNe: boundNe,
                boundSw: boundSw,
                distance: distance,
                duration: duration,
                startLocationLat: startLocationLat,
                startLocationLon: startLocationLng,
                endLocationLat: endLocationLat,
                endLocationLon: endLocationLng,
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
      ),
    );
  }
}

class Btubutton extends StatelessWidget {
  final int amount;
  final String distance;
  final String duration;
  final boundNe;
  final boundSw;
  final String polyLine;
  final double startLocationLat;
  final double startLocationLon;
  final double endLocationLat;
  final double endLocationLon;
  final TextEditingController approxSizeController;
  final TextEditingController approxWeightController;
  final TextEditingController heightController;
  final TextEditingController widthController;
  final TextEditingController pickUpController;
  final TextEditingController dropOffController;
  final TextEditingController discriptionController;
  Btubutton({
    Key? key,
    required this.heightController,
    required this.widthController,
    required this.amount,
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
        onTap: () async {
          String token = await Storage.getToken();
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
                token: token,
                email: CustomersUserModel.email!,
                boundNe: boundNe,
                boundSw: boundSw,
                polyLine: polyLine,
                weight: int.parse(approxWeightController.text),
                height: int.parse(heightController.text),
                distance: distance,
                time: duration,
                size: approxSizeController.text,
                width: widthController.text,
                price: amount.toString(),
                userName: CustomersUserModel.name!,
                pickupAdrress: pickUpController.text,
                pickupLat: startLocationLat,
                pickupLon: startLocationLon,
                dropoffAdress: dropOffController.text,
                dropoffLat: endLocationLat,
                dropoffLon: endLocationLon,
                isSchedule: false,
                discription: discriptionController.text,
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
          String token = await Storage.getToken();

          var package = await userController.createPackage(
            polyLine: polyLine,
            boundNe: boundNe,
            boundSw: boundSw,
            weight: int.parse(approxWeightController.text),
            height: int.parse(heightController.text),
            size: int.parse(approxSizeController.text),
            width: int.parse(widthController.text),
            price: amount.toString(),
            distance: distance,
            time: duration,
            userName: CustomersUserModel.name!,
            pickupAdrress: pickUpController.text,
            pickupLat: startLocationLat.toString(),
            pickupLon: startLocationLon.toString(),
            dropoffAdress: dropOffController.text,
            dropoffLat: endLocationLat.toString(),
            dropoffLon: endLocationLon.toString(),
            isSchedule: false,
            discription: discriptionController.text,
          );
          final String id = package['data']['id'];
          if (kDebugMode) {
            print("packageID $id");
          }
          Get.to(() => SearchingDispatcher(
                token: token,
                name: CustomersUserModel.name!,
                email: CustomersUserModel.name!,
                discription: discriptionController.text,
                boundNe: boundNe,
                boundSw: boundSw,
                polyLine: polyLine,
                packageId: id,
                distance: distance,
                price: amount.toString(),
                time: duration,
                dropOffLocation: LatLng(endLocationLat, endLocationLon),
                pickUpLocation: LatLng(startLocationLat, startLocationLon),
              ));
          if (kDebugMode) {
            print(startLocationLat);
            print(endLocationLon);
            print(endLocationLat);
            print(duration);
            print(amount);
            print(duration);
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
