import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import '../../models/models.dart';
import '../../controllers/controllers.dart';
import 'package:ziklogistics/views/home/home.dart';
import 'package:ziklogistics/views/auth/login_screen.dart';
import 'package:ziklogistics/notification/notification.dart';
import 'package:ziklogistics/global_components/ziklogistics.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:ziklogistics/Dispatcher/views/DispatcherHome/home.dart';
import 'package:ziklogistics/components/Widget/on_boad_page_selection.dart';
import 'package:ziklogistics/Dispatcher/views/Dispatcherauth/login_screen.dart';
// ignore_for_file: file_names

class ChoiceScreen extends StatefulWidget {
  static const String routeName = '/ChioceScreen';
  const ChoiceScreen({super.key});

  @override
  State<ChoiceScreen> createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {
  @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        mainshowDialod(
            context: context,
            onPressed: () => AwesomeNotifications()
                .requestPermissionToSendNotifications()
                .then((value) => Navigator.pop(context)),
            value:
                "To use notification on this app, you need to allow the notifications press the Botton below to Allow!");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: AppColor.mainColor,
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: Image.asset(
                    AppImages.chooseScreenImage,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                const Center(
                  child: Text(
                    'Hi, welcome onboard!',
                    style: TextStyle(
                      color: AppColor.whiteColor,
                      fontFamily: 'DM Sans',
                      fontSize: 30,
                      letterSpacing: 0,
                      fontWeight: FontWeight.bold,
                      height: 1.1,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 40.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.whiteColor,
                    ),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.whiteColor),
                        onPressed: () async {
                          Notify.sendNotice(
                              title: "Welcome",
                              body: "Wecome to Fasta Logistic App ");
                          String? allData = await Storage.getData();
                          if (allData != null) {
                            custormerName = json.decode(allData);

                            log(CustomersUserModel.name!);
                            if (CustomersUserModel.name == null &&
                                CustomersModel.token == null) {
                              Get.to(() => const OnBoardPages());
                            } else if (CustomersModel.token != null &&
                                CustomersUserModel.name == null) {
                              Get.to(() => const LoginScreen());
                            } else if (CustomersModel.token != null &&
                                CustomersUserModel.name != null) {
                              Get.offAll(() => const CostomerHome());
                            }
                          } else {
                            Get.to(() => const OnBoardPages());
                          }
                        },
                        child: const Text(
                          'Sign up as a Customer',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColor.mainColor,
                              fontFamily: 'DMSans',
                              fontSize: 20,
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                              height: 1.5),
                        )),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 40.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.whiteColor,
                    ),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.whiteColor),
                        onPressed: () async {
                          var allData = await DStorage.getDriverData();
                          if (allData != null) {
                            log('Secure storage has data: $allData');
                            driverData = json.decode(allData);

                            if (DriverUserModel.email != null &&
                                DriverUserModel.name != null &&
                                DriverUserModel.bvn != null &&
                                DriverModel().token == null) {
                              Get.to(() => const DispatcherLoginScreen());
                            } else if (DriverUserModel.nin != null &&
                                DriverUserModel.name != null &&
                                DriverUserModel.bvn != null) {
                              Get.offAll(() => const DispatcherHome());
                            }
                          } else {
                            log('Secure storage is empty');
                            Get.offAll(() => const DispatcherOnBoardPages());
                          }
                        },
                        child: const Text(
                          'Sign up as a Dispatcher',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColor.mainColor,
                              fontFamily: 'DMSans',
                              fontSize: 18,
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                              height: 1.5),
                        )),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
              ])),
    );
  }
}
