import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:ziklogistics/models/driver_model.dart';
import 'package:ziklogistics/controllers/controllers.dart';
import 'package:ziklogistics/global_components/ziklogistics.dart';
import 'package:ziklogistics/Dispatcher/views/DispatcherHome/home.dart';
import 'package:ziklogistics/Dispatcher/views/Dispatcherauth/driver_form.dart';
import 'package:ziklogistics/Dispatcher/views/Dispatcherauth/d_register_screen.dart';



class DispatcherVerificationScreen extends StatefulWidget {
  static const String routeName = '/vericationScreen';
  String phoneNumber;

  String email;
  DispatcherVerificationScreen(
      {super.key, required this.phoneNumber, required this.email});

  @override
  State<DispatcherVerificationScreen> createState() =>
      _DispatcherVerificationScreenState();
}

class _DispatcherVerificationScreenState
    extends State<DispatcherVerificationScreen> {
  DriverController driverController = Get.put(DriverController());
  TextEditingController con1 = TextEditingController();
  TextEditingController con2 = TextEditingController();
  TextEditingController con3 = TextEditingController();
  TextEditingController con4 = TextEditingController();
  String? code;
  bool isInCorrect = false;
  String statusCode = "1255";

  @override
  void initState() {
    isInCorrect = false;

    super.initState();
  }

  getOtp() async {
    String otp = await DStorage.getDriverOtp();
    if (kDebugMode) {
      print("Otp :$otp");
    }
    return otp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.only(right: 20, left: 30),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: AppColor.mainColor,
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Text(
                  'Enter the 4-digit code sent to you at \n${widget.phoneNumber} ',
                  style: const TextStyle(
                    color: AppColor.whiteColor,
                    fontFamily: 'DM Sans',
                    fontSize: 20,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  child: Row(
                    children: [
                      Container(
                          height: 45,
                          width: 55,
                          decoration: BoxDecoration(
                              color: AppColor.whiteColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            controller: con1,
                            onChanged: (value) {
                              if (value.length == 1) {
                                setState(() {
                                  code = value;
                                });
                                FocusScope.of(context).nextFocus();
                              } else {
                                if (value.isEmpty) {
                                  FocusScope.of(context).previousFocus();
                                }
                              }
                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          )),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      Container(
                          height: 45,
                          width: 55,
                          decoration: BoxDecoration(
                              color: AppColor.whiteColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            controller: con2,
                            onChanged: (value) {
                              if (value.length == 1) {
                                setState(() {
                                  String nevalue = ("$code$value");

                                  code = nevalue;
                                });
                                FocusScope.of(context).nextFocus();
                              } else {
                                if (value.isEmpty) {
                                  FocusScope.of(context).previousFocus();
                                }
                              }
                            },
                            onSaved: (newValue2) async {
                              setState(() {
                                code = ('$code$newValue2');
                              });
                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          )),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      Container(
                          height: 45,
                          width: 55,
                          decoration: BoxDecoration(
                              color: AppColor.whiteColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            controller: con3,
                            onChanged: (value) {
                              setState(() {
                                String nevalue = ("$code$value");

                                code = nevalue;
                              });
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              } else {
                                if (value.isEmpty) {
                                  FocusScope.of(context).previousFocus();
                                }
                              }
                            },
                            onSaved: (newValue3) {},
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          )),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      Container(
                          height: 45,
                          width: 55,
                          decoration: BoxDecoration(
                              color: AppColor.whiteColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            controller: con4,
                            onChanged: (value) async {
                              String otp = await getOtp();
                              setState(() {
                                String nevalue = ("$code$value");

                                code = nevalue;
                              });
                              if (kDebugMode) {
                                print("this is code$code");
                              }

                              if (otp != code) {
                                setState(() {
                                  isInCorrect = true;
                                });
                              } else {
                                if (kDebugMode) {
                                  print("$otp is the otp, $code is your input");
                                }
                                {
                                  await driverController.getOtp(
                                      code: code!,
                                      phoneNumber: widget.phoneNumber);
                                }
                                final data = await DStorage.getDriverData();
                                if (kDebugMode) {
                                  print(" this is your number");
                                  print(data);
                                  print(" this is your number");
                                }

                                driverData = json.decode(data);
                                if (kDebugMode) {
                                  print(
                                    " this is your number${driverData["user"]["phone"]}");
                                }
                                if (statusCode == '201' &&
                                        DriverUserModel.accountNumber == null ||
                                    DriverUserModel.name == null) {
                                  Get.to(() => DRegisterScreen(
                                        phoneNum: widget.phoneNumber,
                                      ));
                                }
                                else if (DriverUserModel.isCompletedRegistration ==
                                        false ||
                                    DriverUserModel.bvn == null) {
                                  Get.to(
                                    () => const DriverForm(),
                                  );
                                } else {
                                  Get.to(() => const DispatcherHome(),
                                      arguments: {DriverUserModel});
                                }

                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                } else {
                                  if (value.isEmpty) {
                                    FocusScope.of(context).previousFocus();
                                    FocusScope.of(context).previousFocus();
                                    setState(() {
                                      isInCorrect = false;
                                    });
                                  } else if (value.isEmpty ||
                                      con4.value == '') {
                                    FocusScope.of(context).previousFocus();
                                    FocusScope.of(context).previousFocus();
                                    FocusScope.of(context).previousFocus();
                                    FocusScope.of(context).previousFocus();
                                  }
                                }
                              }
                            },
                            decoration: const InputDecoration(
                              hintText: "",
                              border: InputBorder.none,
                            ),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: isInCorrect
                        ? const Text(
                            "Wrong 4-digit code inputed",
                            style: TextStyle(
                                fontFamily: 'DMSans',
                                color: AppColor.errorColor,
                                fontSize: 15,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                                height: 1.5),
                          )
                        : null),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                Row(
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            backgroundColor: AppColor.whiteColor),
                        onPressed: () async {
                          con1.clear();
                          con2.clear();
                          con3.clear();
                          con4.clear();

                          await driverController.loginUser(
                              widget.email, widget.phoneNumber);
                        },
                        child: const Text(
                          'I didn’t recive a code',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColor.mainColor,
                              fontFamily: 'DMSans',
                              fontSize: 15,
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                              height: 1.5),
                        )),
                    const SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            backgroundColor: AppColor.mainSecondryColor),
                        onPressed: () {},
                        child: const Text(
                          'Go back!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColor.whiteColor,
                              fontFamily: 'DMSans',
                              fontSize: 15,
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                              height: 1.5),
                        )),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
              ])),
    );
  }
}
