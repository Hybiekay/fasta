import 'dart:convert';
import 'dart:developer';
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
  bool isLoading = false;
  late String statusCode;
  String code = '9908';
  bool isInCorrect = false;
  String accessCode = "1255";
  @override
  void initState() {
    Storage.CustomerlogOut();
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
      backgroundColor: AppColor.mainColor,
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
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
                      style: TextStyle(
                        color: AppColor.whiteColor,
                        fontFamily: 'DM Sans',
                        fontSize: 20.sp,
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
                                  log("this is code$code");

                                  if (otp != code) {
                                    setState(() {
                                      isInCorrect = true;
                                    });
                                  } else if (otp == code) {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    if (kDebugMode) {
                                      print(
                                          "$otp is the otp, $code is your input");
                                    }

                                    final res = await userController.getOtp(
                                        code: code,
                                        phoneNumber: widget.phoneNumber);
                                    print("this from here to user$res");
                                    custormerData = await Storage.getData();

                                    print(
                                        "this from here to user$custormerData");
                                    if (custormerData != null) {
                                      var data = json.decode(custormerData);
                                      log("this the Storate$custormerData");
                                      log("this the decoded${data}");
                                      if (data["user"]["name"] == null) {
                                        Get.off(() => CustomerRegisterScreen(
                                              phonenum: widget.phoneNumber,
                                            ));
                                      } else if (data["user"]["email"] !=
                                              null &&
                                          data["user"]["name"] != null) {
                                        Get.offAll(() => const CostomerHome(),
                                            arguments: {data});
                                      }
                                      setState(() {
                                        isLoading = false;
                                      });
                                    }

                                    setState(() {
                                      isLoading = false;
                                    });
                                  } else {
                                    setState(() {
                                      isInCorrect = true;
                                    });
                                  }

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
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });
                              await userController.loginUser(
                                  widget.email, widget.phoneNumber);
                              setState(() {
                                isLoading = false;
                              });
                            },
                            child: Text(
                              'I didn’t recive a code',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColor.mainColor,
                                  fontFamily: 'DMSans',
                                  fontSize: 15.sp,
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
                            child: Text(
                              'Go back!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColor.whiteColor,
                                  fontFamily: 'DMSans',
                                  fontSize: 15.sp,
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
