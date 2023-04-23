import 'package:intl/intl.dart';
import 'package:ziklogistics/global_components/ziklogistics.dart';
import 'package:ziklogistics/global_components/message_call_button.dart';

class HistoryCard extends StatelessWidget {
  final String name;
  final DateTime time;
  final String track;
  final bool isPaid;
  final VoidCallback trackPressed;
  final VoidCallback chatPressed;
  final VoidCallback continuePressed;

  const HistoryCard({
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
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
            color: AppColor.whiteColor,
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0).copyWith(top: 10),
                  child: CircleAvatar(),
                ),
                SizedBox(
                  width: 160.w,
                  child: Text(
                    name,
                    style: GoogleFonts.dmSans(
                        color: AppColor.mainColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const Spacer(),
                MessageCallButton(chatPressed: chatPressed),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Text(
                    DateFormat('yyyy-MM-dd HH:mm:ss').format(time),
                    style: GoogleFonts.dmSans(
                        color: AppColor.mainColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Spacer(),
                IsDone(
                  continuePressed: continuePressed,
                  isPaid: isPaid,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, bottom: 10),
              child: GestureDetector(
                onTap: trackPressed,
                child: Text(
                  track,
                  style: GoogleFonts.dmSans(
                      color: AppColor.mainSecondryColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ));
  }
}

class IsDone extends StatelessWidget {
  const IsDone({
    super.key,
    required this.continuePressed,
    required this.isPaid,
  });

  final VoidCallback continuePressed;
  final bool isPaid;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      decoration: BoxDecoration(
          color: AppColor.mainColor, borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: IsDoneOrConBut(continuePressed: continuePressed, isPaid: isPaid),
      ),
    );
  }
}

class IsDoneOrConBut extends StatelessWidget {
  const IsDoneOrConBut({
    super.key,
    required this.continuePressed,
    required this.isPaid,
  });

  final VoidCallback continuePressed;
  final bool isPaid;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: continuePressed,
      child: isPaid
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Done',
                  style: GoogleFonts.dmSans(
                      color: AppColor.mainSecondryColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500)),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Continue',
                  style: GoogleFonts.dmSans(
                      color: AppColor.mainSecondryColor,
                      fontWeight: FontWeight.w500)),
            ),
    );
  }
}
