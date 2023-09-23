import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/product_responce_model.dart';

class Getproduct_servies {
  static Future getporuct() async {
    http.Response response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));
    var result = jsonDecode(response.body);
    print(result);
    return result;
  }

//defrent file calling che
  static Future<List<ProductResMod>> getproduct_modal() async {
    http.Response response = await http.get(
      Uri.parse("https://fakestoreapi.com/products"),
    );

    return productResModFromJson(response.body);
  }
}
