import 'dart:convert';

class Favorite {
  int? id;
  int productid;

  Favorite({
    this.id,
    required this.productid,
  });

  factory Favorite.fromRawJson(String str) =>
      Favorite.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
        id: json["id"] ?? 0,
        productid: json["productid"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productid": productid,
      };
}
