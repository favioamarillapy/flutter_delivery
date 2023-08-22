import 'dart:convert';

class Cart {
  int? id;
  int productid;
  int quantity;

  Cart({
    this.id,
    required this.productid,
    required this.quantity,
  });

  factory Cart.fromRawJson(String str) => Cart.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
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
