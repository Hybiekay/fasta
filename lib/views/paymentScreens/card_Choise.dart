import 'dart:developer';
import 'package:ziklogistics/Apis/bank_api.dart';
import '../../global_components/ziklogistics.dart';
import 'package:ziklogistics/views/meun_screen/meun_screen.dart';
import 'package:ziklogistics/views/paymentScreens/bank_history_card.dart';

// ignore_for_file: prefer_typing_uninitialized_variables

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
  var banks;
  bool isSelected = false;
  var accessCode;
  var reference;
  @override
  void initState() {
    paymentInit();
    super.initState();
  }

  paymentInit() async {
    final res = await BankApi.paymentInit(
        email: widget.email,
        packageId: widget.packageId,
        amount: "${int.parse(widget.amount) * 100}");
    if (res != null) {
      setState(() {
        reference = res["data"]["reference"];
        accessCode = res["data"]["access_code"];
      });
      log(accessCode);
      log(reference);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: AppColor.mainColor,
          child: Column(
            children: [
              const HeaderWidget(subTitle: "Payment"),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              TotalItemBar(
                amount: widget.amount,
                distants: widget.distants,
                time: widget.time,
              ),
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
                    SizedBox(
                        height: 100,
                        child: FutureBuilder(
                            future: BankApi.getCards(),
                            builder: (context, AsyncSnapshot snapshot) {
                              // final data = snapshot[index]
                              if (snapshot.hasData) {
                                return SizedBox(
                                    child: ListView.builder(
                                        itemCount: 2,
                                        itemBuilder: (context, index) {
                                          final data = snapshot.data[index];
                                          return Column(
                                            children: [
                                              const SizedBox(height: 20),
                                              BankHistoryCard(
                                                bankName: data["bank"],
                                                cardNum:
                                                    "${data["bin"]} **** ${data["last4"]}",
                                                bankImage: Image.asset(
                                                    AppImages.mastercardLogo),
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
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.02,
                                              ),
                                            ],
                                          );
                                        }));
                              }
                              return Container();
                            })),
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
                          child: GestureDetector(
                            onTap: () {
                              log(accessCode);
                              log(reference);
                              MakePayment(
                                      email: widget.email,
                                      price: int.parse(widget.amount),
                                      accessCode: accessCode,
                                      context: context,
                                      refrenceCode: reference)
                                  .chargeCardAndMakeMethothd();
                            },
                            // showBottomSheet(
                            //   context: context,
                            //   builder: (context) => const SingleChildScrollView(
                            //     child: BottomCard(),
                            //   ),
                            // );

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
                                Text('Pay with new card',
                                    style: GoogleFonts.dmSans(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: AppColor.whiteColor))
                              ],
                            ),
                          )),
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
                  : const InActiveButtonComp(value: 'Confirm Payment'),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
