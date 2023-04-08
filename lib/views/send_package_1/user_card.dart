import 'package:ziklogistics/chat/chat_screen.dart';
import 'package:ziklogistics/global_components/ziklogistics.dart';

class UserCard extends StatelessWidget {
  String name;

  UserCard({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
          decoration: BoxDecoration(
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.circular(12)),
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                name,
                style: GoogleFonts.dmSans(
                    color: AppColor.mainColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.all(10),
                width: 75,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(ChatScreen.routeName);
                          },
                          child: Image.asset(AppImages.messageICon)),
                      Image.asset(AppImages.callICon),
                    ]),
              )
            ],
          )),
    );
  }
}
