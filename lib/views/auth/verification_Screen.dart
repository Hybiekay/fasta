import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:ziklogistics/views/home/home.dart';
import 'package:ziklogistics/controllers/storage.dart';
import 'package:ziklogistics/models/customers_model.dart';
import 'package:ziklogistics/global_components/ziklogistics.dart';
import 'package:ziklogistics/views/auth/registration_Screen.dart';
import 'package:ziklogistics/controllers/costomer_controller.dart';
// ignore_for_file: must_be_immutable

class VerificationScreen extends StatefulWidget {
  static const String routeName = '/vericationScreen';
  String phoneNumber;
  String email;
  VerificationScreen(
      {super.key, required this.phoneNumber, required this.email});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final CustomerController userController = Get.put(CustomerController());

  late String statusCode;
  String code = '9908';
  bool isInCorrect = false;
  String accessCode = "1255";
  @override
  void initState() {
    isInCorrect = false;
    super.initState();
  }

  getOtp() async {
    String otp = await Storage.getCustomerOtp();
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
                            onSaved: (newValue2) {
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
                            onChanged: (value) async {
                              String otp = await getOtp();

                              setState(() {
                                String nevalue = ("$code$value");

                                code = nevalue;
                              });
                              print("this is code$code");

                              if (otp != code) {
                                setState(() {
                                  isInCorrect = true;
                                });
                              } else {
                                if (kDebugMode) {
                                  print("$otp is the otp, $code is your input");
                                }
                                await userController.getOtp(
                                    code: code,
                                    phoneNumber: widget.phoneNumber);
                              }

                              statusCode = await Storage.getStatusCode();
                              final data = await Storage.getData();
                              custormerName = json.decode(data);
                              if (statusCode == '201' &&
                                      CustomersUserModel.name == "name" ||
                                  CustomersUserModel.name == '') {
                                Get.to(() => CustomerRegisterScreen(
                                      phonenum: widget.phoneNumber,
                                    ));
                              } else if (CustomersUserModel.name != "name" &&
                                  statusCode == "201") {
                                Get.offAll(() => const CostomerHome(),
                                    arguments: {CustomersUserModel});
                              } else {
                                if (statusCode == "403") {
                                  setState(() {
                                    isInCorrect = true;
                                  });
                                }
                              }

                              if (code == "") {}

                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              } else {
                                if (value.isEmpty) {
                                  FocusScope.of(context).previousFocus();
                                  setState(() {
                                    isInCorrect = false;
                                  });
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
                        onPressed: () {
                          userController.loginUser(
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
                        onPressed: () {
                          Navigator.pop(context);
                        },
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
