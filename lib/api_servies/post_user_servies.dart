//rigtations

import 'dart:convert';

import 'package:http/http.dart' as http;

class Userservies {
  //modal without
  // static Future postUservies({
  //   String? firstname,
  //   String? lastname,
  //   String? username,
  //   String? password,
  // }) async {
  //   Map<String, dynamic> repon = {
  //     'first_name': firstname,
  //     'last_name': lastname,
  //     'username': username,
  //     'password': password,
  //     'avatar':""  };
  //
  //   http.Response response = await http.post(
  //       Uri.parse("https://codelineinfotech.com/student_api/User/signup.php"),
  //       body: repon);
  //   var code = jsonDecode(response.body);
  //   print(code);
  //   return code;
  // }

  //Modal with

  static Future<bool> Postmodalwith(Map<String, dynamic> req) async {
    http.Response response = await http.post(
        Uri.parse("https://codelineinfotech.com/student_api/User/signup.php"),
        body: req);
    var resiv = jsonDecode(response.body);
    print("user ${resiv}");
    return resiv['status'];
  }
}
