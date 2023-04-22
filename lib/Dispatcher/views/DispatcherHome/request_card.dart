import 'package:ziklogistics/global_components/ziklogistics.dart';

class RequestCard extends StatelessWidget {
  final bool isScheduled;
  final String name;
  final String price;
  final String time;
  final String distance;
  final String datetime;
  const RequestCard({
    Key? key,
    this.isScheduled = false,
    required this.name,
    required this.price,
    required this.time,
    required this.distance,
    this.datetime = '15/07/2022 - 5:44 PM',
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColor.whiteColor),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.10000000149011612),
                        offset: Offset(0, -5),
                        blurRadius: 10)
                  ],
                  color: AppColor.mainColor,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding:
                                EdgeInsets.only(left: 10, top: 10, right: 7),
                            child: CircleAvatar(),
                          ),
                          Expanded(
                            child: Text(
                              name,
                              textAlign: TextAlign.left,
                              style: GoogleFonts.dmSans(
                                fontSize: 20.sp,
                                color: AppColor.whiteColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15.0, top: 5),
                            child: Image.asset(
                              AppImages.smallWhiteBus,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: <Widget>[
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Distance',
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.dmSans(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12.sp,
                                          color: AppColor.whiteColor),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      distance,
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.dmSans(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.sp,
                                          color: AppColor.whiteColor),
                                    ),
                                  ]),
                              const SizedBox(width: 30),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Time',
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.dmSans(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12.sp,
                                          color: AppColor.whiteColor),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '$time ',
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.dmSans(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.sp,
                                          color: AppColor.whiteColor),
                                    ),
                                  ]),
                              const SizedBox(width: 30),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Price',
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.dmSans(
                                          fontSize: 12.sp,
                                          color: AppColor.whiteColor),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "N$price.00",
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.dmSans(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.sp,
                                          color: AppColor.whiteColor),
                                    ),
                                  ]),
                            ],
                          ),
                        ),
                      ),
                      isScheduled
                          ? Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text(
                                      'Scheduled',
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.dmSans(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12.sp,
                                          color: AppColor.whiteColor),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      datetime,
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.dmSans(
                                          fontSize: 15.sp,
                                          color: AppColor.whiteColor),
                                    ),
                                  ]),
                            )
                          : Container()
                    ])),
          )),
    );
  }
}
