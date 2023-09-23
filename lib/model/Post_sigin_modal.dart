// To parse this JSON data, do
//
//     final signinModel = signinModelFromJson(jsonString);

import 'dart:convert';

SigninModel? signinModelFromJson(String str) =>
    SigninModel.fromJson(json.decode(str));

String signinModelToJson(SigninModel? data) => json.encode(data!.toJson());

class SigninModel {
  SigninModel({
    this.username,
    this.password,
  });

  String? username;
  String? password;

  factory SigninModel.fromJson(Map<String, dynamic> json) => SigninModel(
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}
