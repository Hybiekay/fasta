import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../constants/app_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ziklogistics/global_components/button_component.dart';


class AddnewcardBotton extends StatefulWidget {
  const AddnewcardBotton({
    Key? key,
  }) : super(key: key);

  @override
  State<AddnewcardBotton> createState() => _AddnewcardBottonState();
}

class _AddnewcardBottonState extends State<AddnewcardBotton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showBottomSheet(
          context: context,
          builder: (context) => const SingleChildScrollView(
            child: BottomCard(),
          ),
        );
      },
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColor.mainSecondryColor,
            ),
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 20,
          ),
          Text('Add new card',
              style: GoogleFonts.dmSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColor.whiteColor))
        ],
      ),
    );
  }
}

class BottomCard extends StatefulWidget {
  const BottomCard({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomCard> createState() => _BottomCardState();
}

class _BottomCardState extends State<BottomCard> {
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // String _cardNumber;
  // String _expiryMonth;
  // String _expiryYear;
  // String _cvv;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        decoration: const BoxDecoration(
          color: AppColor.mainColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(12),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              "Add a new card",
              style: GoogleFonts.dmSans(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: AppColor.whiteColor,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Card Number",
              style: GoogleFonts.dmSans(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColor.whiteColor,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.whiteColor),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(12),
                    ],
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter 12 digit card number",
                    ),
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            Column(children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        " Valid Thru",
                        style: GoogleFonts.dmSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColor.whiteColor,
                        ),
                      ),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.whiteColor),
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: AppColor.mainColor,
                            ),
                            label: Text(
                              'Month',
                              style: GoogleFonts.dmSans(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: AppColor.mainColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.whiteColor),
                    width: MediaQuery.of(context).size.width * 0.20,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: AppColor.mainColor,
                        ),
                        label: Text(
                          'Year',
                          style: GoogleFonts.dmSans(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: AppColor.mainColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 19,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CVV",
                        style: GoogleFonts.dmSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColor.whiteColor,
                        ),
                      ),
                      Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.whiteColor),
                          width: MediaQuery.of(context).size.width * 0.27,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(3)
                              ],
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                suffixIcon: Icon(Icons.visibility_off),
                                hintText: "CVV",
                              ),
                              onSaved: (String? value) {
                                // _expiryMonth = value!.trim();
                              },
                              //  validator: card.validCVC,
                            ),
                          )),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ]),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Card Holder’s Name",
                  style: GoogleFonts.dmSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColor.whiteColor,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.whiteColor),
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Name on Card",
                        ),
                      ),
                    )),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            ButtonComp(
              onPressed: () {},
              value: "Save Details",
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
