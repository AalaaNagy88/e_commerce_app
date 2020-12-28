// To parse this JSON data, do
//
//     final cartItemModel = cartItemModelFromJson(jsonString);

import 'dart:convert';

List<CartItemModel> cartItemModelFromJson(String str) => List<CartItemModel>.from(json.decode(str).map((x) => CartItemModel.fromJson(x)));

String cartItemModelToJson(List<CartItemModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartItemModel {
  CartItemModel({
    this.id="",
    this.name="",
    this.price="",
    this.imageUrl="",
    this.size="",
    this.quantity=1,
  });

  String id;
  String name;
  String price;
  String imageUrl;
  String size;
  int quantity;

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    imageUrl: json["imageUrl"],
    size: json["size"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "imageUrl": imageUrl,
    "size": size,
    "quantity": quantity,
  };
}
