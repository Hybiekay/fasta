import 'package:get/get.dart';
import 'verification_Screen.dart';
import 'package:flutter/material.dart';
import 'package:ziklogistics/constants/appocolor.dart';
import 'package:ziklogistics/global_components/form_field.dart';
import 'package:ziklogistics/controllers/drivers_controller.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';

class DispatcherLoginScreen extends StatefulWidget {
  static const String routeName = '/DispatcherloginScreen';
  const DispatcherLoginScreen({super.key});

  @override
  State<DispatcherLoginScreen> createState() => _DispatcherLoginScreenState();
}

class _DispatcherLoginScreenState extends State<DispatcherLoginScreen> {
  late FlCountryCodePicker countryPicker;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  DriverController driverController = Get.put(DriverController());
  String? formattedPhoneNumber;
  String? phoneNumber;
  CountryCode? countryCode;
  bool inCorrect = false;

  @override
  void initState() {
    final favoriteCountries = ['NG', "US", 'CA'];
    countryPicker = FlCountryCodePicker(
      favorites: favoriteCountries,
      favoritesIcon: const Icon(
        Icons.favorite,
        color: AppColor.mainColor,
      ),
    );
    super.initState();
  }

  pickCountry(BuildContext context) async {
    final code = await countryPicker.showPicker(context: context);
    setState(() {
      countryCode = code;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                  const Text(
                    'Enter your mobile number',
                    style: TextStyle(
                      color: AppColor.whiteColor,
                      fontFamily: 'DM Sans',
                      fontSize: 20,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w700,
                      height: 1.1,
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
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 80,
                            height: 45,
                            decoration: BoxDecoration(
                                color: AppColor.whiteColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: TextButton.icon(
                                  onPressed: () {
                                    pickCountry(context);
                                  },
                                  icon: const Icon(Icons.arrow_drop_down),
                                  label: countryCode != null
                                      ? countryCode!.flagImage
                                      : const Text("")),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.64,
                          height: 45,
                          decoration: BoxDecoration(
                              color: AppColor.whiteColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: phoneController,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                      hintText: 'Mobile Number',
                                      prefixIcon: SizedBox(
                                        width: 60,
                                        height: 45,
                                        child: Center(
                                          child: Text(
                                              countryCode?.dialCode ?? '+1'),
                                        ),
                                      ),
                                      border: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  formfied(
                    emailController: emailController,
                    hintText: 'Email',
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: inCorrect
                          ? const Text(
                              "Wrong mobile number inputed",
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
                    height: MediaQuery.of(context).size.height * 0.10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.whiteColor,
                    ),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.whiteColor),
                        onPressed: () async {
                          if (countryCode != null &&
                              phoneController.text == ' ') {
                            setState(() {
                              inCorrect = true;
                            });
                          }
                          if (countryCode != null) {
                            setState(() {
                              phoneNumber = countryCode!.dialCode +
                                  phoneController.text.trim();
                              formattedPhoneNumber = phoneNumber!.substring(1);
                            });

                            driverController.loginUser(
                                emailController.text, formattedPhoneNumber!);

                            Get.to(() => DispatcherVerificationScreen(
                                phoneNumber: formattedPhoneNumber!,
                                email: emailController.text));
                          } else {
                            setState(() {
                              inCorrect = true;
                            });
                          }
                        },
                        child: const Text(
                          'Next',
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'By continuing you may recive an SMS for \nverification. Message and data rates may apply.',
                      style: TextStyle(
                        color: AppColor.whiteColor,
                        fontFamily: 'DMSans',
                        fontSize: 15,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1.1,
                      ),
                    ),
                  ),
                ])),
      ),
    );
  }
}
