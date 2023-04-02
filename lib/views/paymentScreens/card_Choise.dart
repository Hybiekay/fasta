import 'package:flutter/material.dart';
import 'package:ziklogistics/constants/appImages.dart';
import 'package:ziklogistics/constants/appocolor.dart';
import 'package:ziklogistics/global_components/headerbar.dart';
import 'package:ziklogistics/views/meun_screen/meunScreen.dart';
import 'package:ziklogistics/global_components/dialogAlert.dart';
import 'package:ziklogistics/global_components/inActiveButtom.dart';
import 'package:ziklogistics/views/paymentScreens/add_new_card.dart';
import 'package:ziklogistics/global_components/button_component.dart';
import 'package:ziklogistics/global_components/total_item_bar_comp.dart';
import 'package:ziklogistics/views/paymentScreens/bank_history_card.dart';

class CardChoice extends StatefulWidget {
  static const String routeName = '/cardChoice';
  final String distants;
  final String amount;
  final String time;
  final String userName;
  final String email;

  final String packageId;
  const CardChoice({
    super.key,
    required this.distants,
    required this.amount,
    required this.time,
    required this.userName,
    required this.email,
    required this.packageId,
  });

  @override
  State<CardChoice> createState() => _CardChoiceState();
}

class _CardChoiceState extends State<CardChoice> {
  // ignore: prefer_typing_uninitialized_variables
  var banks;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: AppColor.mainColor,
        child: Column(
          children: [
            headerWidget(subTitle: "Payment"),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const TotalItemBar(amount: "20,000", distants: "15.2", time: "82"),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Bank_history_card(
                    bankName: "UBA",
                    cardNum: "**** **** *** 8395",
                    bankImage: Image.asset(AppImages.mastercardLogo),
                    radio: Radio(
                      value: 1,
                      onChanged: (value) {
                        setState(() {
                          banks = value!;
                          isSelected = true;
                        });
                      },
                      groupValue: banks,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Bank_history_card(
                    bankName: "FCMB",
                    cardNum: "*** **** *** 8395",
                    bankImage: Image.asset(AppImages.visalogo),
                    radio: Radio(
                      value: 2,
                      onChanged: (value) {
                        setState(() {
                          banks = value!;
                          isSelected = true;
                        });
                      },
                      groupValue: banks,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.mainColor),
                        child: const AddnewcardBotton()),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                ],
              ),
            ),
            const Spacer(),
            isSelected
                ? ButtonComp(
                    onPressed: () {
                      successShowDialod(
                          context: context,
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.of(context).canPop();
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.of(context).pushNamed(
                              MeunScreen.routeName,
                            );
                          },
                          value:
                              "Both the payment and delivery have \nbeen confirmed. Dispatcher would \ncome for pickup in 5 mins.");
                    },
                    value: 'Confirm Payment',
                  )
                : inActiveButtonComp(value: 'Confirm Payment'),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
