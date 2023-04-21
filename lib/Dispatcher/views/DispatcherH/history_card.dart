import 'package:intl/intl.dart';
import 'package:ziklogistics/global_components/ziklogistics.dart';

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0).copyWith(top: 20),
                child: CircleAvatar(),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    name,
                    style: GoogleFonts.dmSans(
                        color: AppColor.mainColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    DateFormat('yyyy-MM-dd HH:mm:ss').format(time),
                    style: GoogleFonts.dmSans(
                        color: AppColor.mainColor,
                        fontSize: 15.sp,
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
                          fontSize: 12.sp,
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
                              child: Image.asset(AppImages.messageICon,
                                  scale: 0.8.r)),
                          SizedBox(
                            width: 4.w,
                          ),
                          Image.asset(AppImages.callICon, scale: 0.8.r),
                        ]),
                    SizedBox(height: 10.h),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColor.mainColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: GestureDetector(
                          onTap: continuePressed,
                          child: isPaid
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Paid',
                                    style: GoogleFonts.dmSans(
                                        color: AppColor.mainSecondryColor,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Unpaid',
                                      style: GoogleFonts.dmSans(
                                          color: AppColor.mainSecondryColor,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500)),
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
