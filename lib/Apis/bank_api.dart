import 'dart:convert';
import 'package:get/get.dart';
import '../controllers/storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:ziklogistics/global_components/ziklogistics.dart';
import 'package:ziklogistics/views/DeliveryH/delivery_history.dart';
// ignore_for_file: use_build_context_synchronously


// ignore_for_file: public_member_api_docs, sort_constructors_first

class BankApi {
  static Future paymentInit({
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

  static Future getCards() async {
    String token = await Storage.getToken();
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

  // String _getReference() {
  //   String platform;
  //   if (Platform.isIOS) {
  //     platform = 'iOS';
  //   } else {
  //     platform = 'Android';
  //   }

  //   return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  // }

  ///method Charging card

  chargeCardAndMakeMethothd() async {
    initializePlugin().then((value) async {
      Charge charge = Charge()
        ..amount = price * 100
        ..email = email
        ..accessCode = accessCode
        ..reference = refrenceCode
        ..card = getCardUi();

      CheckoutResponse response = await paystack.checkout(
        context,
        charge: charge,
        method: CheckoutMethod.card,
        fullscreen: false,
        logo: Image.asset(AppImages.logo),
      );

      if (response.status == true) {
        if (kDebugMode) {
          print("Transation Succesfull");
        }
        if (kDebugMode) {
          print("Respose $response");
        }

        await BankApi.paymentVerify(
            reference: refrenceCode, accessCode: accessCode);
        successShowDialod(
            context: context,
            value:
                "Both the payment and delivery have \nbeen confirmed. Dispatcher would \ncome for pickup in 5 mins.",
            onPressed: () {
              Get.to(() => const Deliveryhistory());
            });
      } else {
        if (kDebugMode) {
          print("Trasation Unseccsfull");
        }

        // failedShowDialod(
        //     context: context,
        //     value: "Your transcation Is Uns ",
        //     onPressed: () {});
      }
    });
  }
}
