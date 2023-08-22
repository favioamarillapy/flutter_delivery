import 'package:meta/meta.dart';
import 'dart:convert';

class Favorite {
  int? id;
  int productid;
  int quantity;

  Favorite({
    this.id,
    required this.productid,
    required this.quantity,
  });

  factory Favorite.fromRawJson(String str) =>
      Favorite.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
        id: json["id"] ?? 0,
        productid: json["productid"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productid": productid,
        "quantity": quantity,
      };
}
