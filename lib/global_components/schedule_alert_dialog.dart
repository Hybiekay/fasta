import 'package:get/get.dart';
import 'package:ziklogistics/global_components/ziklogistics.dart';
import 'package:ziklogistics/controllers/costomer_controller.dart';
// ignore_for_file: prefer_typing_uninitialized_variables

// ignore_for_file: use_build_context_synchronously

// ignore_for_file: prefer_const_literals_to_create_immutables

class ScheduleAlertDialog extends StatefulWidget {
  final String size, width, userName, pickupAdrress, dropoffAdress, discription;
  final bool isSchedule;
  final int weight, height;
  final double pickupLat;
  final double pickupLon;
  final double dropoffLat;
  final double dropoffLon;
  final String distance;
  final String email;
  final String time;
  final String price;
  final String token;
  final boundNe;
  final boundSw;
  final String polyLine;

  const ScheduleAlertDialog({
    super.key,
    required this.boundNe,
    required this.boundSw,
    required this.polyLine,
    required this.size,
    required this.width,
    required this.userName,
    required this.pickupAdrress,
    required this.dropoffAdress,
    required this.discription,
    required this.isSchedule,
    required this.weight,
    required this.height,
    required this.distance,
    required this.time,
    required this.price,
    required this.pickupLat,
    required this.pickupLon,
    required this.dropoffLat,
    required this.dropoffLon,
    required this.email,
    required this.token,
  });

  @override
  State<ScheduleAlertDialog> createState() => _ScheduleAlertDialogState();
}

class _ScheduleAlertDialogState extends State<ScheduleAlertDialog> {
  final CustomerController userController = Get.put(CustomerController());

  DateTime date = DateTime.now();

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    final hour = date.hour.toString().padLeft(2, "0");
    final minute = date.minute.toString().padLeft(2, '0');
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(),
      contentPadding: const EdgeInsets.symmetric(),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      title: userController.state
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Schedule Time',
                  style: GoogleFonts.dmSans(
                    color: AppColor.mainColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                GestureDetector(
                  onTap: () async {
                    final dateTime = await pickDateTime(context, date);

                    if (dateTime != null) {
                      setState(() {
                        date = dateTime;
                        isSelected = true;
                      });
                      setState(() {});
                    }
                  },
                  child: Container(
                      height: 45.h,
                      decoration: BoxDecoration(
                        color: AppColor.mainColor,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppImages.timeImage,
                              width: 20.w,
                              height: 20.h,
                            ),
                            isSelected
                                ? Text(
                                    "${date.year}/${date.month}/${date.day}  $hour:$minute",
                                    style: GoogleFonts.dmSans(
                                      color: AppColor.whiteColor,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                : Text(
                                    'Select A Time & Date',
                                    style: GoogleFonts.dmSans(
                                      color: AppColor.whiteColor,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                            Image.asset(
                              AppImages.downArrw,
                              width: 10.w,
                              height: 5.h,
                            )
                          ],
                        ),
                      )),
                ),
                SizedBox(
                  height: 30.h,
                ),
                const Divider(
                  color: AppColor.thinLineColor,
                  thickness: 3,
                ),
                SizedBox(
                  height: 20.h,
                ),
                GestureDetector(
                  onTap: () async {
                    setState(() {
                      userController.state = true;
                    });
                    final data = await userController.createPackage(
                        polyLine: widget.polyLine,
                        boundNe: widget.boundNe,
                        boundSw: widget.boundSw,
                        weight: widget.weight,
                        height: widget.height,
                        distance: widget.distance,
                        time: widget.time,
                        size: int.parse(widget.size),
                        width: int.parse(widget.width),
                        price: widget.price,
                        userName: widget.userName,
                        pickupAdrress: widget.pickupAdrress,
                        pickupLat: widget.pickupLat.toString(),
                        pickupLon: widget.pickupLon.toString(),
                        dropoffAdress: widget.dropoffAdress,
                        dropoffLat: widget.dropoffLat.toString(),
                        dropoffLon: widget.dropoffLon.toString(),
                        isSchedule: true,
                        discription: widget.discription,
                        scheduledTime:
                            "${date.year}/${date.month}/${date.day} ",
                        scheduleddate: "$hour:$minute");
                    setState(() {
                      userController.state = false;
                    });
                    Get.off(() => SearchingDispatcher(
                          token: widget.token,
                          email: widget.email,
                          name: widget.userName,
                          discription: widget.discription,
                          boundNe: widget.boundNe,
                          boundSw: widget.boundSw,
                          polyLine: widget.polyLine,
                          packageId: data["data"]['id'],
                          dateTime:
                              "${date.year}/${date.month}/${date.day}  $hour:$minute",
                          time: widget.time,
                          price: widget.price,
                          distance: widget.distance,
                          pickUpLocation:
                              LatLng(widget.pickupLat, widget.pickupLon),
                          dropOffLocation:
                              LatLng(widget.dropoffLat, widget.dropoffLon),
                          isSchedule: true,
                        ));
                  },
                  child: Text(
                    'Confirm',
                    style: GoogleFonts.dmSans(
                      color: AppColor.mainColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

Future<DateTime?> pickDateTime(
    BuildContext context, DateTime initialDate) async {
  DateTime? date = await putdate(context, initialDate);
  if (date == null) return null;
  TimeOfDay? time = await puttime(context, initialDate);
  if (time == null) return null;

  DateTime newdateTime = DateTime(
    date.year,
    date.month,
    date.day,
    time.hour,
    time.minute,
  );
  return newdateTime;
}

Future<DateTime?> putdate(BuildContext context, DateTime initialDate) {
  return showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: DateTime(2023),
    lastDate: DateTime(2024),
  );
}

Future<TimeOfDay?> puttime(BuildContext context, DateTime initialTime) {
  return showTimePicker(
    context: context,
    initialTime: TimeOfDay(hour: initialTime.hour, minute: initialTime.minute),
  );
}
