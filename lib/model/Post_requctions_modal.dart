// To parse this JSON data, do
//
//     final signupModel = signupModelFromJson(jsonString);

import 'dart:convert';

SignupModel? signupModelFromJson(String str) =>
    SignupModel.fromJson(json.decode(str));

String signupModelToJson(SignupModel? data) => json.encode(data!.toJson());

class SignupModel {
  SignupModel({
    this.firstName,
    this.lastName,
    this.username,
    this.password,
    this.avatar,
  });

  String? firstName;
  String? lastName;
  String? username;
  String? password;
  String? avatar;

  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        firstName: json["first_name"],
        lastName: json["last_name"],
        username: json["username"],
        password: json["password"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "username": username,
        "password": password,
        "avatar": avatar,
      };
}

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);
