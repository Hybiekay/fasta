import 'package:ziklogistics/global_components/ziklogistics.dart';

class NodataCard extends StatelessWidget {
  final String content;
  const NodataCard({
    required this.content,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 25.h,
        ),
        Image.asset(
          AppImages.homePageImage,
          width: 300.w,
          height: 158.h,
          filterQuality: FilterQuality.high,
        ),
        SizedBox(
          height: 25.h,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: Text(
              content,
              textAlign: TextAlign.center,
              style: GoogleFonts.dmSans(
                fontSize: 32.sp,
                color: AppColor.whiteColor,
                fontWeight: FontWeight.w700,
              ),
            ))
      ],
    );
  }
}
