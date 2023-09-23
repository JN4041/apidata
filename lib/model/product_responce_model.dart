// To parse this JSON data, do
//
//     final productResMod = productResModFromJson(jsonString);

import 'dart:convert';

List<ProductResMod> productResModFromJson(String str) =>
    List<ProductResMod>.from(
        json.decode(str).map((x) => ProductResMod.fromJson(x)));

String productResModToJson(List<ProductResMod> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductResMod {
  ProductResMod({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  factory ProductResMod.fromJson(Map<String, dynamic> json) => ProductResMod(
        id: json["id"],
        title: json["title"],
        price: json["price"].toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: Rating.fromJson(json["rating"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "rating": rating?.toJson(),
      };
}

class Rating {
  Rating({
    this.rate,
    this.count,
  });

  double? rate;
  int? count;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"].toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };
}
