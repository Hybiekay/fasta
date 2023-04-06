import 'package:get/get.dart';
import 'package:ziklogistics/global_components/ziklogistics.dart';
import 'package:ziklogistics/controllers/costomer_controller.dart';
import 'package:ziklogistics/views/send_package_1/getlocation.dart';
// ignore_for_file: prefer_const_literals_to_create_immutables

class ScheduleAlertDialog extends StatefulWidget {
  final String size, width, userName, pickupAdrress, dropoffAdress, discription;
  final bool isSchedule;

  const ScheduleAlertDialog({
    super.key,
    required this.size,
    required this.width,
    required this.userName,
    required this.pickupAdrress,
    required this.dropoffAdress,
    required this.discription,
    required this.isSchedule,
  });

  @override
  State<ScheduleAlertDialog> createState() => _ScheduleAlertDialogState();
}

class _ScheduleAlertDialogState extends State<ScheduleAlertDialog> {
  final CustomerController userController = Get.put(CustomerController());

  DateTime date = DateTime(2023, 2, 23, 10, 30);

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    final hour = date.hour.toString().padLeft(2, "0");
    final minute = date.minute.toString().padLeft(2, '0');
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(),
      contentPadding: const EdgeInsets.symmetric(),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      title: Column(
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
                              "${date.year}/${date.month}/${date.day}  $hour:$minute")
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
              var _pickUpcoordinates =
                  await GoogleApi.getLocation(adress: widget.pickupAdrress);
              var dropOffcoordinates =
                  await GoogleApi.getLocation(adress: widget.dropoffAdress);

              double distance = await GoogleApi.getdistane(
                  startLat: _pickUpcoordinates!.last.latitude,
                  startLng: _pickUpcoordinates.last.longitude,
                  endLat: dropOffcoordinates!.last.latitude,
                  endLng: dropOffcoordinates.last.longitude);
              double kg = distance / 1000;
              double price = (int.parse(widget.size) * kg * 15);

              double time = 60 * kg / 60;
              int totalPrice;
              if (price < 500) {
                totalPrice = 500;
              } else {
                totalPrice = price.toInt();
              }
              final data = await userController.createPackage(
                  height: 10,
                  weight: 20,
                  distance: kg.toInt().toString(),
                  time: "9",
                  size: int.parse(widget.size),
                  width: int.parse(widget.width),
                  price: totalPrice.toString(),
                  userName: widget.userName,
                  pickupAdrress: widget.pickupAdrress,
                  pickupLat: _pickUpcoordinates.last.latitude.toString(),
                  pickupLon: _pickUpcoordinates.last.longitude.toString(),
                  dropoffAdress: widget.dropoffAdress,
                  dropoffLat: dropOffcoordinates.last.hashCode.toString(),
                  dropoffLon: dropOffcoordinates.last.longitude.toString(),
                  isSchedule: true,
                  discription: widget.discription,
                  scheduledTime: "${date.year}/${date.month}/${date.day} ",
                  scheduleddate: "$hour:$minute");

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SearchingDispatcher(
                            // packageId: data["id"],
                            dateTime: "${date.year}/${date.month}/${date.day} ",
                            time: "${time.toInt()}",
                            price: "${totalPrice.toInt()}",
                            distance: "${kg.toInt()}",
                            sLocation: LatLng(
                              _pickUpcoordinates.last.latitude,
                              _pickUpcoordinates.last.latitude,
                            ),
                            dLocation: LatLng(dropOffcoordinates.last.latitude,
                                _pickUpcoordinates.last.latitude),
                            isSchedule: true,
                          )));
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
