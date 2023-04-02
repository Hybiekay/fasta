import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ziklogistics/constants/appocolor.dart';

class Bank_history_card extends StatelessWidget {
  String bankName;
  String cardNum;
  Widget bankImage;
  Widget radio;

  Bank_history_card({
    required this.bankName,
    required this.cardNum,
    required this.bankImage,
    required this.radio,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            style: BorderStyle.solid,
            color: AppColor.mainColor,
            width: 2,
          )),
      child: ListTile(
        minVerticalPadding: 2,
        minLeadingWidth: 4,
        leading: bankImage,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(bankName),
            Expanded(
              child: Text(cardNum,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.dmSans(fontWeight: FontWeight.w500)),
            ),
          ],
        ),
        trailing: SizedBox(width: 30, child: radio),
      ),
    );
  }
}
