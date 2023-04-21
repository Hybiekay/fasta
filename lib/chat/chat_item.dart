import 'package:intl/intl.dart';
import '../global_components/ziklogistics.dart';

class SingleChat extends StatelessWidget {
  final String message;
  final DateTime time;
  final bool isMe;
  const SingleChat({
    Key? key,
    required this.time,
    required this.message,
    required this.isMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5)
          .copyWith(left: isMe ? 70 : 0, right: isMe ? 0 : 70),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment:
                  isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                  margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5)
                      .copyWith(left: isMe ? 70 : 0, right: isMe ? 0 : 70),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12).copyWith(
                          bottomRight: Radius.circular(isMe ? 0 : 12),
                          bottomLeft: Radius.circular(isMe ? 12 : 0)),
                      color: isMe ? AppColor.isMecolor : Colors.white),
                  child: Column(
                    crossAxisAlignment: isMe
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0).copyWith(
                            right: isMe ? 20 : 0, left: isMe ? 0 : 20),
                        child: Text(
                          message,
                          textAlign: TextAlign.start,
                          style: GoogleFonts.dmSans(
                            fontSize: 15.h,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.0,
                            color: isMe ? AppColor.whiteColor : Colors.black,
                          ),
                        ),
                      ),
                      Text(
                        DateFormat('hh:mm a').format(time),
                        style: GoogleFonts.dmSans(
                          fontSize: 10.h,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.0,
                          color: isMe ? AppColor.whiteColor : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 20,
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
