import 'package:intl/intl.dart';
import 'package:ziklogistics/global_components/ziklogistics.dart';
import 'package:ziklogistics/global_components/message_call_button.dart';

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
        padding: const EdgeInsets.all(10),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  CircleAvatar(),
                  SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                    width: 151.w,
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 40,
                    ),
                    child: Text(
                      DateFormat('yyyy-MM-dd HH:mm:ss').format(time),
                      style: GoogleFonts.dmSans(
                          color: AppColor.mainColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Spacer(),
                  IsPaidButton(continuePressed: continuePressed, isPaid: isPaid)
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: GestureDetector(
                  onTap: trackPressed,
                  child: Text(
                    track,
                    style: GoogleFonts.dmSans(
                        color: AppColor.mainSecondryColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ));
  }
}

class IsPaidButton extends StatelessWidget {
  const IsPaidButton({
    super.key,
    required this.continuePressed,
    required this.isPaid,
  });

  final VoidCallback continuePressed;
  final bool isPaid;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.mainColor, borderRadius: BorderRadius.circular(5)),
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
    );
  }
}
