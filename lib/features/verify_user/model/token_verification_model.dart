import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TokenVerificationModel {
  final String email;
  final String token;
  TokenVerificationModel({
    required this.email,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'token': token,
    };
  }

  factory TokenVerificationModel.fromMap(Map<String, dynamic> map) {
    return TokenVerificationModel(
      email: map['email'] as String,
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TokenVerificationModel.fromJson(String source) => TokenVerificationModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
