import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ziklogistics/constants/appocolor.dart';
import 'package:ziklogistics/views/DeliveryH/ColmpletedHistoryList.dart';
import 'package:ziklogistics/views/DeliveryH/ongiong_list.dart';

class ongoingComleteSwicth extends StatefulWidget {
  const ongoingComleteSwicth({
    Key? key,
  }) : super(key: key);

  @override
  State<ongoingComleteSwicth> createState() => _ongoingComleteSwicthState();
}

class _ongoingComleteSwicthState extends State<ongoingComleteSwicth> {
  bool isComple = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            color: AppColor.whiteColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isComple = false;
                  });
                },
                child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: isComple
                            ? AppColor.whiteColor
                            : AppColor.mainSecondryColor),
                    child: Center(
                      child: Text(
                        "Ongoing",
                        style: GoogleFonts.dmSans(
                          color: isComple
                              ? AppColor.mainColor
                              : AppColor.whiteColor,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isComple = true;
                  });
                },
                child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: isComple
                            ? AppColor.mainSecondryColor
                            : AppColor.whiteColor),
                    child: Center(
                      child: Text(
                        "Completed",
                        style: GoogleFonts.dmSans(
                          color: isComple
                              ? AppColor.whiteColor
                              : AppColor.mainColor,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )),
              )
            ],
          ),
        ),
        isComple ? const Completedlist() : const Ongoinglist()
      ],
    );
  }
}
