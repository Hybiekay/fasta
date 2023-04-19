import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ziklogistics/constants/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ziklogistics/extensions/custom_extension.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first


class HeaderWidget extends StatelessWidget {
  final String subTitle;
  final VoidCallback onPressed;
  const HeaderWidget({
    Key? key,
    required this.subTitle,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.09,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColor.whiteColor),
                child: Center(
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 17,
                    ),
                    onPressed: onPressed
                  ).center,
                ),
              ),
              const Spacer(),
              Text(
                subTitle,
                style: GoogleFonts.dmSans(
                  color: AppColor.whiteColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
