// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

import 'cart_item_model.dart';

OrderModel orderModelFromJson(String str) => OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  OrderModel({
    this.address="",
    this.phone="",
    this.total=1,
    this.items,
  });

  String address;
  String phone;
  int total;
  List<CartItemModel> items;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    address: json["address"],
    phone: json["phone"],
    total: json["total"],
    items: List<CartItemModel>.from(json["items"].map((x) => CartItemModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "phone": phone,
    "total": total,
    "items": List<CartItemModel>.from(items.map((x) => x.toJson())),
  };
}

