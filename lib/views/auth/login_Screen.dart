import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:get/get.dart';
import 'package:ziklogistics/controllers/costomer_controller.dart';
import 'package:ziklogistics/views/auth/verification_Screen.dart';

import '../../controllers/storage.dart';
import '../../global_components/ziklogistics.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/loginScreen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  CustomerController userController = Get.put(CustomerController());

  late FlCountryCodePicker countryPicker;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String? formattedPhoneNumber;
  String? phoneNumber;
  CountryCode? countryCode;
  bool inCorrect = false;
  bool isLoading = false;
  @override
  void initState() {
    Storage.CustomerlogOut();
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
      backgroundColor: AppColor.mainColor,
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
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
                      'Enter your mobile number',
                      style: TextStyle(
                        color: AppColor.whiteColor,
                        fontFamily: 'DM Sans',
                        fontSize: 20.sp,
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
                            width: MediaQuery.of(context).size.height * 0.303,
                            height: 45,
                            decoration: BoxDecoration(
                                color: AppColor.whiteColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: phoneController,
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                        hintText: 'Mobile Number',
                                        hintStyle: GoogleFonts.dmSans(),
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
                    const SizedBox(height: 20),
                    Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: AppColor.whiteColor,
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.only(left: 12),
                      child: TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintStyle: GoogleFonts.dmSans(),
                            hintText: 'E-Mail',
                            border: InputBorder.none),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: inCorrect
                            ? Text(
                                "Wrong mobile number inputed",
                                style: TextStyle(
                                    fontFamily: 'DMSans',
                                    color: AppColor.errorColor,
                                    fontSize: 15.sp,
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
                      height: 40.h,
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
                            } else if (countryCode != null) {
                              setState(() {
                                phoneNumber = countryCode!.dialCode +
                                    phoneController.text.trim();
                                formattedPhoneNumber =
                                    phoneNumber!.substring(1);
                              });
                              setState(() {
                                isLoading = true;
                              });

                              await userController.loginUser(
                                  emailController.text, formattedPhoneNumber!);
                              setState(() {
                                isLoading = false;
                              });

                              Get.to(() => VerificationScreen(
                                  phoneNumber: formattedPhoneNumber!,
                                  email: emailController.text));
                            } else {
                              setState(() {
                                inCorrect = true;
                              });
                            }
                          },
                          child: Text(
                            'Next',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColor.mainColor,
                                fontFamily: 'DMSans',
                                fontSize: 20.sp,
                                letterSpacing: 0,
                                fontWeight: FontWeight.bold,
                                height: 1.5),
                          )),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'By continuing you may recive an SMS for \nverification. Message and data rates may apply.',
                        style: TextStyle(
                          color: AppColor.whiteColor,
                          fontFamily: 'DMSans',
                          fontSize: 15.sp,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 1.1,
                        ),
                      ),
                    ),
                  ])),
    );
  }
}
