import 'dart:convert';


String productModelToJson(List<ProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  ProductModel({
    this.id,
    this.name,
    this.price,
    this.description,
    this.category,
    this.imageUrl,
  });
  String id;
  String name;
  String price;
  String description;
  String category;
  String imageUrl;

  factory ProductModel.fromJson(Map<String, dynamic> json,String pid) => ProductModel(
    id:pid,
    name: json["name"],
    price: json["price"],
    description: json["description"],
    category: json["category"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "price": price,
    "description": description,
    "category": category,
    "imageUrl": imageUrl,
  };
}
