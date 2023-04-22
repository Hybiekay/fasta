import 'dart:io';
import 'package:get/get.dart';
import 'package:ziklogistics/models/models.dart';
import '../../../controllers/drivers_controller.dart';
import '../../../global_components/ziklogistics.dart';
import 'package:ziklogistics/components/pick_image.dart';
import 'package:ziklogistics/Dispatcher/views/DispatcherHome/home.dart';
import 'package:ziklogistics/Dispatcher/views/Dispatcherauth/login_screen.dart';

class DriverForm extends StatefulWidget {
  final String name;
  static const String routeName = '/driverfromScreen';
  const DriverForm({super.key, required this.name});

  @override
  State<DriverForm> createState() => _DriverFormState();
}

class _DriverFormState extends State<DriverForm> {
  DriverController driverController = Get.put(DriverController());
  final fullNameCon = TextEditingController(text: "${DriverUserModel.name}");
  final bvNumCon = TextEditingController();
  final ninCon = TextEditingController();
  bool isloading = false;
  bool isComplete = false;
  bool value = false;
  File? driverImage;
  File? ninImage;
  File? dobImage;
  bool driverIsUploaded = false;
  bool ninIsUploaded = false;
  bool dobIsUploaded = false;
  @override
  void dispose() {
    fullNameCon.dispose();
    ninCon.dispose();
    bvNumCon.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: isloading
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColor.mainSecondryColor,
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    Text(
                      "Please enter the right data in the box.",
                      style: GoogleFonts.dmSans(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColor.whiteColor,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Your Name",
                      style: GoogleFonts.dmSans(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: AppColor.whiteColor,
                      ),
                    ),
                    Formfied(
                        emailController: fullNameCon,
                        hintText: "Full Name",
                        keyboardType: TextInputType.number),
                    const SizedBox(height: 20),
                    Text(
                      "Enter your BVN",
                      style: GoogleFonts.dmSans(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: AppColor.whiteColor,
                      ),
                    ),
                    Formfied(
                        emailController: bvNumCon,
                        hintText: "BVN Number",
                        keyboardType: TextInputType.number),
                    const SizedBox(height: 20),
                    Text(
                      "Enter your NIN",
                      style: GoogleFonts.dmSans(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: AppColor.whiteColor,
                      ),
                    ),
                    Formfied(
                      emailController: ninCon,
                      hintText: "NIN Number",
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Upload your Birth Certificate",
                      style: GoogleFonts.dmSans(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: AppColor.whiteColor,
                      ),
                    ),
                    UploadBotton(
                      onPressed: () async {
                        File? dob = await pickImage();
                        if (dob != null) {
                          setState(() {
                            dobImage = dob;
                            dobIsUploaded = true;
                          });
                        }
                      },
                      uploaded: dobIsUploaded,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Upload your NIN Card",
                      style: GoogleFonts.dmSans(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: AppColor.whiteColor,
                      ),
                    ),
                    UploadBotton(
                      onPressed: () async {
                        File? nin = await pickImage();
                        if (nin != null) {
                          setState(() {
                            ninImage = nin;
                            ninIsUploaded = true;
                          });
                        }
                      },
                      uploaded: ninIsUploaded,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Upload your Driver’s License Card",
                      style: GoogleFonts.dmSans(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: AppColor.whiteColor,
                      ),
                    ),
                    UploadBotton(
                      onPressed: () async {
                        File? driver = await pickImage();
                        if (driver != null) {
                          setState(() {
                            driverImage = driver;
                            driverIsUploaded = true;
                          });
                        }
                      },
                      uploaded: driverIsUploaded,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Checkbox(
                            value: value,
                            onChanged: (v) {
                              if (ninCon.text == '' || bvNumCon.text == "") {
                                setState(() {
                                  isComplete = false;
                                });
                                Get.snackbar("Notice", "All feild Are Required",
                                    snackPosition: SnackPosition.BOTTOM);
                              } else {
                                setState(() {
                                  value = v!;
                                  isComplete = true;
                                });
                              }
                            }),
                        Expanded(
                          child: Text(
                            "Please be aware that you are not eligible to receive any dispatcher requests until you have received admin approval. If you are approved, the null-tag will become approved, and if you are rejected, it will become disapproved.",
                            style: GoogleFonts.dmSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColor.whiteColor,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    isComplete
                        ? ButtonComp(
                            onPressed: () async {
                              if (driverImage == null ||
                                  ninImage == null ||
                                  dobImage == null) {
                                Get.snackbar("Notice", "Pick all the Image",
                                    snackPosition: SnackPosition.BOTTOM);
                              } else {
                                File dImg = driverImage!;
                                File ninImg = ninImage!;
                                File dobImg = dobImage!;
                                setState(() {
                                  isloading = true;
                                });
                                await driverController.uplold(
                                    name: fullNameCon.text,
                                    nin: ninCon.text,
                                    bvn: bvNumCon.text,
                                    bvnImage: dImg,
                                    ninImage: ninImg,
                                    dobImage: dobImg);
                                setState(() {
                                  isloading = false;
                                });
                                successShowDialod(
                                    context: context,
                                    onPressed: () {
                                      Get.offAll(() => DispatcherLoginScreen());
                                    },
                                    value:
                                        'Your registration is now complete, and you can proceed to log in as a Dispatcher.',
                                    bottonValue: "Login");
                              }
                            },
                            value: "Complete")
                        : const InActiveButtonComp(value: "Complete"),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
    );
  }
}

class UploadBotton extends StatelessWidget {
  final bool uploaded;
  final VoidCallback onPressed;
  const UploadBotton({
    super.key,
    this.uploaded = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: uploaded ? 78 : 48,
        width: 128,
        decoration: BoxDecoration(
            color: AppColor.whiteColor,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            uploaded
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      AppImages.failedAlertImage,
                      height: 20,
                      width: 18,
                    ),
                  )
                : Container(),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                uploaded ? "Uploaded" : "Upload",
                style: GoogleFonts.dmSans(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: AppColor.mainColor),
              ),
              const SizedBox(width: 15),
              Image.asset(AppImages.uploadIcon)
            ]),
          ],
        ),
      ),
    );
  }
}
