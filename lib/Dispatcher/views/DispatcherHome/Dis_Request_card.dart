import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ziklogistics/constants/appImages.dart';
import 'package:ziklogistics/constants/appocolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ziklogistics/global_components/dialogAlert.dart';
import 'package:ziklogistics/Dispatcher/views/meun_screen/meunScreen.dart';
// ignore_for_file: must_be_immutable

class dispatcherRequsetCard extends StatelessWidget {
  bool isScahedule;
  dispatcherRequsetCard({
    this.isScahedule = false,
    Key? key,
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
                              "Opeyemi Akinyemi",
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
                                  "15.2 km",
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
                                  "82 Min",
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
                                  "₦20,005.00",
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
                          ? TextPreviwe(
                              type: "Scheduled", value: "15/07/2022 - 5:44 PM")
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
                            value: "//\\??",
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          TextPreviwe(
                            type: "Approx. size",
                            value: "//\\??",
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextPreviwe(
                        type: "Pick-up location",
                        value: "//\\??",
                      ),
                      TextPreviwe(
                        type: "Drop-off location",
                        value: "//\\??",
                      ),
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
          botButton(isScahedule: isScahedule),
          const SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}

class botButton extends StatelessWidget {
  const botButton({
    Key? key,
    required this.isScahedule,
  }) : super(key: key);

  final bool isScahedule;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
              onPressed: () {
                failedShowDialod(
                  context: context,
                  value:
                      'You have cancelled this dispatch request. Await another request.',
                  onPressed: () {},
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
                onPressed: () {
                  successShowDialod(
                    context: context,
                    value: isScahedule
                        ? "You have confirmed to deliver this sheduled package. Go for pickup at the time scheduled"
                        : "You have confirmed to deliver this package. Go for pickup in 5 mins.",
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.of(context).pushNamed(
                        DispatcherMeunScreen.routeName,
                      );
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
  String type;
  String value;
  TextPreviwe({
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
