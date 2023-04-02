import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:ziklogistics/global_components/ziklogistics.dart';

class BankApi {
  Future paymentInit({
    required String token,
    required String email,
    required String packageId,
    required String amount,
  }) async {
    final url = Uri.parse("${AppApis.endPoint}payment/init");
    final response = await http.post(url, headers: {
      'Authorization': 'Bearer $token',
    }, body: {
      "email": email,
      "amount": amount,
      "packageId": packageId
    });
    if (kDebugMode) {
      print(response.body);
    }
    final data = json.decode(response.body);
    return data;
  }

  Future paymentVerify({
    required String token,
    required String reference,
    required String accessCode,
  }) async {
    final url = Uri.parse("${AppApis.endPoint}payment/verify");
    final response = await http.post(url, headers: {
      'Authorization': 'Bearer $token',
    }, body: {
      "reference": reference,
      "accesscode": accessCode
    });
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

  PaymentCard _getCardFromUI(
    
  ) {
    // Using just the must-required parameters.
    return PaymentCard(
      number: "",
      cvc: "",
      expiryMonth: 0,
      expiryYear: 0,
    );
  }

  _chargeCard(String accessCode) async {
    var charge = Charge()
      ..accessCode = accessCode
      ..card = _getCardFromUI();

  //   final response = await plugin.chargeCard(context, charge: charge);
  //   // Use the response
   }
}
