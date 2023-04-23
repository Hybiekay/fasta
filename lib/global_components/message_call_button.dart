import 'package:ziklogistics/global_components/ziklogistics.dart';


class MessageCallButton extends StatelessWidget {
  const MessageCallButton({
    super.key,
    required this.chatPressed,
  });

  final VoidCallback chatPressed;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      GestureDetector(
          onTap: chatPressed,
          child: Image.asset(AppImages.messageICon, scale: 0.7.r)),
      SizedBox(
        width: 4.w,
      ),
      Image.asset(AppImages.callICon, scale: 0.7.r),
    ]);
  }
}
