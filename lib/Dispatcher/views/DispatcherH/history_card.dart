import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ziklogistics/constants/app_color.dart';
import 'package:ziklogistics/constants/app_images.dart';

class DispatcherHistoryCard extends StatelessWidget {
  final String name;
  final DateTime time;
  final String track;
  final bool isPaid;
  final VoidCallback trackPressed;
  final VoidCallback chatPressed;
  final VoidCallback continuePressed;

  const DispatcherHistoryCard({
    Key? key,
    this.isPaid = false,
    required this.continuePressed,
    required this.name,
    required this.time,
    required this.track,
    required this.trackPressed,
    required this.chatPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.circular(12)),
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(),
              ),
              const SizedBox(
                width: 5,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.dmSans(
                        color: AppColor.mainColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    DateFormat('yyyy-MM-dd HH:mm:ss').format(time),
                    style: GoogleFonts.dmSans(
                        color: AppColor.mainColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: trackPressed,
                    child: Text(
                      track,
                      style: GoogleFonts.dmSans(
                          color: AppColor.mainSecondryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 7),
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: chatPressed,
                              child: Image.asset(AppImages.messageICon)),
                          const SizedBox(
                            width: 5,
                          ),
                          Image.asset(AppImages.callICon),
                        ]),
                    const SizedBox(height: 20),
                    Container(
                      height: 30,
                      width: 60,
                      decoration: BoxDecoration(
                          color: AppColor.mainColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: GestureDetector(
                          onTap: continuePressed,
                          child: isPaid
                              ? const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Paid',
                                    style:
                                        TextStyle(color: AppColor.whiteColor),
                                  ),
                                )
                              : const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Unpaid',
                                    style:
                                        TextStyle(color: AppColor.whiteColor),
                                  ),
                                ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
