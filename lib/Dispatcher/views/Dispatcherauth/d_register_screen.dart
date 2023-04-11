import 'package:get/get.dart';
import '../../../global_components/ziklogistics.dart';
import 'package:ziklogistics/controllers/controllers.dart';
import 'package:ziklogistics/Dispatcher/views/Dispatcherauth/driver_form.dart';

class DRegisterScreen extends StatefulWidget {
  final String phoneNum;
  const DRegisterScreen({super.key, required this.phoneNum});

  @override
  State<DRegisterScreen> createState() => _DRegisterScreenState();
}

class _DRegisterScreenState extends State<DRegisterScreen> {
  DriverController driverController = Get.put(DriverController());
  TextEditingController fullNameCon = TextEditingController();
  TextEditingController acountNumCon = TextEditingController();
  TextEditingController acountNameCon = TextEditingController();
  TextEditingController bankNameCon = TextEditingController();
  bool isComplete = false;
  String dropDownvalue = "Monthly";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 70),
              Text(
                "Please enter the right data in the box.",
                style: GoogleFonts.dmSans(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColor.whiteColor,
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Enter your full name",
                style: GoogleFonts.dmSans(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: AppColor.whiteColor,
                ),
              ),
              Formfied(
                emailController: fullNameCon,
                hintText: 'Full Name',
              ),
              const SizedBox(height: 30),
              Text(
                "Bank Name",
                style: GoogleFonts.dmSans(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: AppColor.whiteColor,
                ),
              ),
              Formfied(
                  emailController: bankNameCon,
                  hintText: "Bank Name",
                  keyboardType: TextInputType.name),
              const SizedBox(height: 30),
              Text(
                "Account Number",
                style: GoogleFonts.dmSans(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: AppColor.whiteColor,
                ),
              ),
              Formfied(
                emailController: acountNumCon,
                hintText: "Account Number",
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 30),
              Text(
                "Account Name",
                style: GoogleFonts.dmSans(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: AppColor.whiteColor,
                ),
              ),
              Formfied(
                emailController: acountNameCon,
                hintText: 'Account Name',
              ),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: const EdgeInsets.only(left: 20),
                  margin: const EdgeInsets.symmetric(horizontal: 5)
                      .copyWith(right: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.backgroundsecondary),
                    color: AppColor.mainColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButtonFormField(
                      borderRadius: BorderRadius.circular(20),
                      alignment: Alignment.center,
                      value: dropDownvalue,
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                      icon: const Icon(Icons.arrow_drop_down_outlined),
                      dropdownColor: AppColor.mainSecondryColor,
                      items: const [
                        DropdownMenuItem(
                          value: "Weekly",
                          child: Center(
                            child: Text(
                              "Weekly",
                              style: TextStyle(
                                  color: AppColor.whiteColor,
                                  fontFamily: 'DMSans',
                                  fontSize: 18,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w700,
                                  height: 1.5),
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: "Monthly",
                          child: Center(
                            child: Text(
                              "Monthly",
                              style: TextStyle(
                                  color: AppColor.whiteColor,
                                  fontFamily: 'DMSans',
                                  fontSize: 16,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w700,
                                  height: 1.5),
                            ),
                          ),
                        ),
                      ],
                      onChanged: (v) {
                        setState(() {
                          v = dropDownvalue;
                        });
                        if (acountNameCon.text == "" ||
                            acountNumCon.text == '' ||
                            bankNameCon.text == '' ||
                            fullNameCon.text == '') {
                          setState(() {
                            isComplete = false;
                          });
                          Get.snackbar("Notice", "All Feild Are Required",
                              snackPosition: SnackPosition.BOTTOM);
                        } else {
                          setState(() {
                            isComplete = true;
                          });
                        }
                      }),
                ),
              ),
              const SizedBox(height: 100),
              isComplete
                  ? ButtonComp(
                      onPressed: () async {
                        await driverController.updateName(
                            name: fullNameCon.text,
                            phoneNumber: widget.phoneNum,
                            driverAccName: acountNameCon.text,
                            driverAccNum: acountNumCon.text,
                            driverBank: bankNameCon.text,
                            paymentOption: dropDownvalue);
                        acountNameCon.clear();
                        acountNumCon.clear();
                        bankNameCon.clear();
                        fullNameCon.clear();
                        Get.to(() => const DriverForm());
                      },
                      value: "Complete")
                  : InActiveButtonComp(value: "Complete"),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
