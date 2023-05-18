import 'package:get/get.dart';
import 'verification_screen.dart';
import 'package:ziklogistics/controllers/controllers.dart';
import 'package:ziklogistics/global_components/ziklogistics.dart';
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
  bool isLoading = false;

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
    DStorage.driverlogOut();
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
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
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
                                width:
                                    MediaQuery.of(context).size.height * 0.302,
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
                                            hintStyle: GoogleFonts.dmSans(),
                                            prefixIcon: SizedBox(
                                              width: 60,
                                              height: 45,
                                              child: Center(
                                                child: Text(
                                                    countryCode?.dialCode ??
                                                        '+1'),
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
                        Formfied(
                          emailController: emailController,
                          hintText: 'Email',
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
                          width: MediaQuery.of(context).size.width,
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
                                }
                                if (countryCode != null) {
                                  setState(() {
                                    phoneNumber = countryCode!.dialCode +
                                        phoneController.text.trim();
                                    formattedPhoneNumber =
                                        phoneNumber!.substring(1);
                                  });

                                  setState(() {
                                    isLoading = true;
                                  });
                                  driverController.loginUser(
                                      emailController.text,
                                      formattedPhoneNumber!);
                                  setState(() {
                                    isLoading = false;
                                  });

                                  Get.to(() => DispatcherVerificationScreen(
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
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'By continuing you will receive an SMS for \nverification. Data rates may apply.',
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
            ),
    );
  }
}
