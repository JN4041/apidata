//login
import 'dart:convert';

import 'package:http/http.dart' as http;

class Siginservies {
  static Future<bool> Signup_servies(Map<String, dynamic> resp) async {
    http.Response response = await http.post(
        Uri.parse("https://codelineinfotech.com/student_api/User/login.php"),
        body: resp);
    var resin = jsonDecode(response.body);
    print(resin);
    return resin['status'];
  }
}
