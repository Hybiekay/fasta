import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ziklogistics/constants/app_color.dart';
import 'package:ziklogistics/constants/app_images.dart';

class HistoryCard extends StatelessWidget {
  final String name;
  final DateTime time;
  final String track;
  final VoidCallback trackPressed;
  final VoidCallback chatPressed;

 const HistoryCard({
    Key? key,
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
                child: Row(
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
              )
            ],
          )),
    );
  }
}
