import 'dart:ui';
import 'package:get/instance_manager.dart';
import 'package:ziklogistics/models/customersModel.dart';
import 'package:ziklogistics/controllers/controllers.dart';
import 'package:ziklogistics/global_components/ziklogistics.dart';
import 'package:ziklogistics/views/send_package_1/getlocation.dart';
// ignore_for_file: use_build_context_synchronously

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final approxSizeController = TextEditingController();
    final approxWeightController = TextEditingController();
    final pickUpController = TextEditingController();
    final dropOffController = TextEditingController();
    final disController = TextEditingController();

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
                      val1: approxSizeController,
                      val2: approxWeightController,
                      desc1: 'Approx. Size',
                      img1: AppImages.packageImg,
                      textField1: 'Approx. size of the package',
                      desc2: 'Approx. Weight',
                      img2: AppImages.packageImg,
                      textField2: 'Approx. weight of the package',
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
                        val1: pickUpController,
                        val2: dropOffController,
                        desc1: 'Pickup',
                        img1: AppImages.pickUp,
                        textField1: 'Pickup location for the package',
                        desc2: 'Drop-off',
                        img2: AppImages.locatnImg,
                        textField2: 'Drop-off location for the package'),
                    SizedBox(
                      height: 8.h,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: AppColor.whiteColor,
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.only(left: 12),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: disController,
                          maxLength: 1000,
                          maxLines: 4,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                              hintText: 'Discription ',
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TotalItemBar(
                      amount: "",
                      distants: "15.2",
                      time: "82",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Btubutton(
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

class Btubutton extends StatefulWidget {
  final TextEditingController approxSizeController;
  final TextEditingController approxWeightController;
  final TextEditingController pickUpController;
  final TextEditingController dropOffController;
  final TextEditingController discriptionController;
  const Btubutton({
    Key? key,
    required this.approxSizeController,
    required this.approxWeightController,
    required this.pickUpController,
    required this.discriptionController,
    required this.dropOffController,
  }) : super(key: key);

  @override
  State<Btubutton> createState() => _BtubuttonState();
}

class _BtubuttonState extends State<Btubutton> {
  final CustomerController userController = Get.put(CustomerController());

  @override
  void initState() {
    super.initState();
  }

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
                size: widget.approxSizeController.text,
                width: widget.approxWeightController.text,
                discription: widget.discriptionController.text,
                pickupAdrress: widget.pickUpController.text,
                dropoffAdress: widget.dropOffController.text,
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
          var pickUpcoordinates =
              await GoogleApi.getLocation(adress: widget.pickUpController.text);
          final dropOffcoordinates =
              await GoogleApi.getLocation(adress: widget.pickUpController.text);

          double distance = await GoogleApi.getdistane(
              startLat: pickUpcoordinates!.last.latitude,
              startLng: pickUpcoordinates.last.longitude,
              endLat: dropOffcoordinates!.last.latitude,
              endLng: dropOffcoordinates.last.longitude);
          double kg = distance / 1000;
          double price =
              (int.parse(widget.approxSizeController.text) * kg * 15);
          double time = 60 * kg / 60;
          int totalPrice;
          if (price < 500) {
            totalPrice = 500;
          } else {
            totalPrice = price.toInt();
          }
          final package = await userController.createPackage(
            time: time,
            size: int.parse(widget.approxSizeController.text),
            width: int.parse(widget.approxWeightController.text),
            price: totalPrice.toString(),
            userName: CustomersUserModel.name!,
            pickupAdrress: widget.pickUpController.text,
            pickupLat: pickUpcoordinates.last.latitude.toString(),
            pickupLon: pickUpcoordinates.last.longitude.toString(),
            dropoffAdress: widget.dropOffController.text,
            dropoffLat: dropOffcoordinates.last.latitude.toString(),
            dropoffLon: dropOffcoordinates.last.longitude.toString(),
            isSchedule: false,
            discription: widget.discriptionController.text,
          );
          if (kDebugMode) {
            print(distance);
          }
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SearchingDispatcher(
                        packageId: package["id"],
                        distance: "${kg.toInt()}",
                        price: "${price.toInt()}",
                        time: "$totalPrice",
                        dLocation: LatLng(
                          double.parse("${pickUpcoordinates.last.latitude}"),
                          double.parse("${pickUpcoordinates.last.longitude}"),
                        ),
                        sLocation: LatLng(
                          double.parse("${pickUpcoordinates.last.latitude}"),
                          double.parse("${pickUpcoordinates.last.latitude}"),
                        ),
                      )));

          if (kDebugMode) {
            print(widget.approxSizeController.text);
            print(widget.approxWeightController.text);
            print(widget.pickUpController.text);
            print(widget.dropOffController.text);
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
