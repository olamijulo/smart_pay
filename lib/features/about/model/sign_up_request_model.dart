import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SignUpRequestModel {
  final String fullName;
  final String? userName;
  final String email;
  final String country;
  final String password;
  final String deviceName;
  
  SignUpRequestModel({
    required this.fullName,
    this.userName,
    required this.email,
    required this.country,
    required this.password,
    required this.deviceName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'full_name': fullName,
      'userName': userName,
      'email': email,
      'country': country,
      'password': password,
      'device_name': deviceName,
    };
  }

  factory SignUpRequestModel.fromMap(Map<String, dynamic> map) {
    return SignUpRequestModel(
      fullName: map['fullName'] as String,
      userName: map['userName'] != null ? map['userName'] as String : null,
      email: map['email'] as String,
      country: map['country'] as String,
      password: map['password'] as String,
      deviceName: map['deviceName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUpRequestModel.fromJson(String source) => SignUpRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
