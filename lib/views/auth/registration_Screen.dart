import 'package:get/get.dart';
import 'package:ziklogistics/views/auth/login_screen.dart';
import 'package:ziklogistics/controllers/controllers.dart';
import 'package:ziklogistics/global_components/ziklogistics.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';

class CustomerRegisterScreen extends StatefulWidget {
  final String phonenum;
  static const String routeName = '/customerregisterScreen';
  const CustomerRegisterScreen({super.key, required this.phonenum});

  @override
  State<CustomerRegisterScreen> createState() => _CustomerRegisterScreenState();
}

class _CustomerRegisterScreenState extends State<CustomerRegisterScreen> {
  final CustomerController userController = Get.put(CustomerController());

  late FlCountryCodePicker countryPicker;
  final TextEditingController nameController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
              padding: const EdgeInsets.only(right: 20, left: 20),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: AppColor.mainColor,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                    ),
                    Text(
                      'What\'s your full name',
                      style: TextStyle(
                        color: AppColor.whiteColor,
                        fontFamily: 'DM Sans',
                        fontSize: 20.sp,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w700,
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
                            padding: const EdgeInsets.only(right: 20),
                            width: MediaQuery.of(context).size.width * 0.85,
                            height: 45,
                            decoration: BoxDecoration(
                                color: AppColor.whiteColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: TextField(
                                      controller: nameController,
                                      keyboardType: TextInputType.name,
                                      decoration: InputDecoration(
                                          hintStyle: GoogleFonts.dmSans(),
                                          hintText: 'Full Name',
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
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
                            setState(() {
                              isLoading = true;
                            });
                            var response = await userController.updateName(
                                name: nameController.text,
                                phoneNumber: widget.phonenum);
                            print("This is ul response $response");

                            if (response["name"] != null) {
                              successShowDialod(
                                  context: context,
                                  onPressed: () {
                                    Get.off(() => LoginScreen());
                                  },
                                  value:
                                      ' "Your registration has been successfully completed, and you may now log in as a customer."',
                                  bottonValue: "Login");
                              setState(() {
                                isLoading = false;
                              });
                            }
                            setState(() {
                              isLoading = false;
                            });
                          },
                          child: Text(
                            'Complete',
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
                  ])),
    );
  }
}
