import 'dart:convert';
// ignore_for_file: prefer_typing_uninitialized_variables

var custormerData;
var cData = json.decode(custormerData);

class CustomersModel {
  static String? token = cData['token'];
}

class CustomersUserModel {
  static String? id = cData['user']['name'];
  static String? email = cData['user']['email'];
  static String? name = cData['user']['name'];
  static String? phone = cData['user']['phone'];
  static String? state = cData['user']['state'];
  static String? latitude = cData['user']['latitude'];
  static String? longitude = cData['user']['longitude'];
  static String? role = cData['user']['role'];
}

class User {
  final String id;
  final String email;
  final String name;
  final String phone;
  final String? state;
  final double? latitude;
  final double? longitude;
  final String role;
  final String month;
  final String year;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
    required this.role,
    required this.month,
    required this.year,
    this.state,
    this.latitude,
    this.longitude,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      state: json['state'],
      latitude: json['latitude']?.toDouble(),
      longitude: json['longitude']?.toDouble(),
      role: json['role'],
      month: json['month'],
      year: json['year'],
    );
  }
}

class AuthResponse {
  final String token;
  final User user;

  AuthResponse({
    required this.token,
    required this.user,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      token: json['token'],
      user: User.fromJson(json['user']),
    );
  }
}
