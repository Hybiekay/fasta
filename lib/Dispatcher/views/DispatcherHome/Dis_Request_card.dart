import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../controllers/drivers_controller.dart';
import 'package:ziklogistics/constants/app_color.dart';
import 'package:ziklogistics/constants/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ziklogistics/global_components/dialog_alert.dart';
import 'package:ziklogistics/views/DeliveryH/delivery_history.dart';
import 'package:ziklogistics/Dispatcher/views/DispatcherHome/home.dart';

// ignore_for_file: use_build_context_synchronously

class DispatcherRequsetCard extends StatelessWidget {
  final String name;
  final String distance;
  final String time;
  final String price;
  final String size;
  final String withe;
  final String pickUp;
  final String dropOff;
  final String scheduleTime;
  final String packAgeId;
  final bool isScahedule;
  const DispatcherRequsetCard({
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
    required this.packAgeId,
    this.isScahedule = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.whiteColor,
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  height: isScahedule ? 160 : 150,
                  decoration: BoxDecoration(
                      color: AppColor.mainColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CircleAvatar(),
                            Text(
                              name,
                              style: GoogleFonts.dmSans(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: AppColor.whiteColor,
                              ),
                            ),
                            Image.asset(AppImages.smallWhiteBus),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Distance",
                                  style: GoogleFonts.dmSans(
                                    color: AppColor.whiteColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  height: 9.h,
                                ),
                                Text(
                                  distance,
                                  style: GoogleFonts.dmSans(
                                    color: AppColor.whiteColor,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 30.w,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Time",
                                  style: GoogleFonts.dmSans(
                                    color: AppColor.whiteColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  height: 9.h,
                                ),
                                Text(
                                  time,
                                  style: GoogleFonts.dmSans(
                                    color: AppColor.whiteColor,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 30.w,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Price",
                                  style: GoogleFonts.dmSans(
                                    color: AppColor.whiteColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  height: 9.h,
                                ),
                                Text(
                                  "₦ $price",
                                  overflow: TextOverflow.fade,
                                  style: GoogleFonts.dmSans(
                                    color: AppColor.whiteColor,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      isScahedule
                          ? TextPreviwe(type: "Scheduled", value: scheduleTime)
                          : const Divider()
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.mainColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Delivery Information",
                              style: GoogleFonts.dmSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColor.whiteColor,
                              ),
                            ),
                            Image.asset(AppImages.smallWhiteBus),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          TextPreviwe(
                            type: "Approx. size",
                            value: size,
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          TextPreviwe(
                            type: "Approx. size",
                            value: withe,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      AdressPreview(v: "Pick-up location", details: pickUp),
                      const SizedBox(
                        height: 15,
                      ),
                      AdressPreview(v: "Drop-off location", details: dropOff),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "The dispatch request was provided based on your location.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.dmSans(
                      fontSize: 16.h,
                      fontWeight: FontWeight.w500,
                      color: AppColor.mainColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          BotButton(isScahedule: isScahedule, packAgeId: packAgeId),
          const SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}

class AdressPreview extends StatelessWidget {
  const AdressPreview({super.key, required this.details, required this.v});

  final String details;
  final String v;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          v,
          style: GoogleFonts.dmSans(
            fontSize: 11.w,
            fontWeight: FontWeight.w500,
            color: AppColor.whiteColor,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          details,
          overflow: TextOverflow.clip,
          style: GoogleFonts.dmSans(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: AppColor.whiteColor,
          ),
        ),
      ],
    );
  }
}

class BotButton extends StatelessWidget {
  final String packAgeId;
  const BotButton({
    Key? key,
    required this.packAgeId,
    required this.isScahedule,
  }) : super(key: key);

  final bool isScahedule;

  @override
  Widget build(BuildContext context) {
    DriverController driverController = Get.put(DriverController());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
              onPressed: () async {
                await driverController.rejectPackage(packageId: packAgeId);

                failedShowDialod(
                  context: context,
                  value:
                      'You have cancelled this dispatch request. Await another request.',
                  onPressed: () {
                    Get.to(() => const DispatcherHome());
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
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () async {
                  await driverController.acceptPackage(packageId: packAgeId);
                  successShowDialod(
                    context: context,
                    value: isScahedule
                        ? "You have confirmed to deliver this sheduled package. Go for pickup at the time scheduled"
                        : "You have confirmed to deliver this package. Go for pickup in 5 mins.",
                    onPressed: () {
                      Get.off(() => const Deliveryhistory());
                    },
                  );
                },
                child: const Text("Confirm",
                    style: TextStyle(
                        color: AppColor.mainColor,
                        fontFamily: 'DMSans',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        height: 1.5))),
          )
        ],
      ),
    );
  }
}

class TextPreviwe extends StatelessWidget {
  final String type;
  final String value;
  const TextPreviwe({
    required this.type,
    required this.value,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, bottom: 5),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                type,
                style: GoogleFonts.dmSans(
                  fontSize: 11.w,
                  fontWeight: FontWeight.w500,
                  color: AppColor.whiteColor,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                value,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.dmSans(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColor.whiteColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
