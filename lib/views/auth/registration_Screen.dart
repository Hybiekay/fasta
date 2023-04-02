import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ziklogistics/models/models.dart';
import 'package:ziklogistics/views/home/home.dart';
import 'package:ziklogistics/constants/appocolor.dart';
import 'package:ziklogistics/global_components/ziklogistics.dart';
import 'package:ziklogistics/controllers/costomer_controller.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                const Text(
                  'What\'s your full name',
                  style: TextStyle(
                    color: AppColor.whiteColor,
                    fontFamily: 'DM Sans',
                    fontSize: 20,
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
                                  decoration: const InputDecoration(
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
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.whiteColor,
                  ),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.whiteColor),
                      onPressed: () {
                        userController.updateName(
                            name: nameController.text,
                            phoneNumber: widget.phonenum);

                        if (CustomersUserModel.name != null) {
                          if (kDebugMode) {
                            print(CustomersUserModel.name);
                          }
                          Get.to(() => const CostomerHome(),
                              arguments: {CustomersUserModel});
                        } else {
                  
                        }
                      },
                      child: const Text(
                        'Complete',
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
              ])),
    );
  }
}
