import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ziklogistics/constants/app_color.dart';
import 'package:ziklogistics/constants/app_images.dart';

class DispatcherHistoryCard extends StatelessWidget {
  String name;
  String time;
  String track;
  VoidCallback trackPressed;

  DispatcherHistoryCard({
    Key? key,
    required this.name,
    required this.time,
    required this.track,
    required this.trackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Container(
          decoration: BoxDecoration(
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.circular(12)),
          height: 100,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(),
              ),
              const SizedBox(
                width: 10,
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
                    time,
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
                margin: const EdgeInsets.all(10),
                width: 75,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(AppImages.messageICon),
                      Image.asset(AppImages.callICon),
                    ]),
              )
            ],
          )),
    );
  }
}
