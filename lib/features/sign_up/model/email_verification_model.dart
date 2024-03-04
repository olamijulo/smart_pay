import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class EmailVerificationModel {
  final String email;
  EmailVerificationModel({
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
    };
  }

  factory EmailVerificationModel.fromMap(Map<String, dynamic> map) {
    return EmailVerificationModel(
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory EmailVerificationModel.fromJson(String source) =>
      EmailVerificationModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}



class EmailVerificationResponseModel {
  final String token;
  EmailVerificationResponseModel({
    required this.token,
  });

  factory EmailVerificationResponseModel.fromMap(Map<String, dynamic> map) {
    return EmailVerificationResponseModel(
      token: map['token'] as String,
    );
  }

  factory EmailVerificationResponseModel.fromJson(String source) => EmailVerificationResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
