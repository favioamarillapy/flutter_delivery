import 'dart:convert';

class Promotion {
  int id;
  String title;
  String subtitle;
  String discount;
  String image;

  Promotion({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.discount,
    required this.image,
  });

  factory Promotion.fromRawJson(String str) =>
      Promotion.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Promotion.fromJson(Map<String, dynamic> json) => Promotion(
        id: json["id"],
        title: json["title"],
        subtitle: json["subtitle"],
        discount: json["discount"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "discount": discount,
        "image": image,
      };
}
