import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SignInModel {
  final String email;
  final String password;
  final String deviceName;

  SignInModel({
    required this.email,
    required this.password,
    required this.deviceName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'device_name': deviceName,
    };
  }

  String toJson() => json.encode(toMap());

}



// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);


LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
    final User? user;
    final String? token;

    LoginResponseModel({
        this.user,
        this.token,
    });

    factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "token": token,
    };
}

class User {
    final String? id;
    final String? fullName;
    final String? username;
    final String? email;
    final dynamic phone;
    final dynamic phoneCountry;
    final String? country;
    final dynamic avatar;

    User({
        this.id,
        this.fullName,
        this.username,
        this.email,
        this.phone,
        this.phoneCountry,
        this.country,
        this.avatar,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fullName: json["full_name"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        phoneCountry: json["phone_country"],
        country: json["country"],
        avatar: json["avatar"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "username": username,
        "email": email,
        "phone": phone,
        "phone_country": phoneCountry,
        "country": country,
        "avatar": avatar,
    };
}
