import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:ziklogistics/global_components/ziklogistics.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class BankApi {
  Future paymentInit({
    required String email,
    required String packageId,
    required String amount,
  }) async {
    final url = Uri.parse("${AppApis.endPoint}payment/init");
    final response = await http.post(url,
        body: {"email": email, "amount": amount, "packageId": packageId});
    if (kDebugMode) {
      print(response.body);
    }
    final data = json.decode(response.body);
    return data;
  }

  static Future paymentVerify({
    required String reference,
    required String accessCode,
  }) async {
    final url = Uri.parse("${AppApis.endPoint}payment/verify");
    final response = await http
        .post(url, body: {"reference": reference, "accesscode": accessCode});
    if (kDebugMode) {
      print(response.body);
    }
    final data = json.decode(response.body);
    return data;
  }

  static Future getCards({
    required String token,
  }) async {
    final url = Uri.parse("${AppApis.endPoint}payment/get-cards");
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (kDebugMode) {
      print(response.body);
    }
    final data = json.decode(response.body);
    return data;
  }
}

class MakePayment {
  BuildContext context;
  int price;
  String email;
  String refrenceCode;
  String accessCode;
  MakePayment({
    required this.accessCode,
    required this.context,
    required this.price,
    required this.email,
    required this.refrenceCode,
  });
  PaymentCard getCardUi() {
    return PaymentCard(number: '', cvc: '', expiryMonth: 0, expiryYear: 0);
  }

  PaystackPlugin paystack = PaystackPlugin();
  Future initializePlugin() async {
    await paystack.initialize(publicKey: AppApis.payStackApiKey);
  }

  ///method Charging card

  chargeCardAndMakeMethothd() async {
    initializePlugin().then((value) async {
      Charge charge = Charge()
        ..amount = price * 100
        ..email = email
        ..reference = refrenceCode
        ..accessCode = accessCode
        ..card = getCardUi();

      CheckoutResponse response = await paystack.checkout(context,
          charge: charge,
          method: CheckoutMethod.card,
          fullscreen: false,
          logo: Image.asset(AppImages.logo),
          
          
          );


      print("Respose $response");

      if (response.status == true) {
        print("Transation Succesfull");

        BankApi.paymentVerify(reference: refrenceCode, accessCode: accessCode);
      } else {
        print("Trasation Unseccsfull");
        failedShowDialod(
            context: context,
            value: "Your transcation Is Uns ",
            onPressed: () {});
      }
    });
  }
}
