import 'dart:convert';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  OrderModel({
    this.address = "",
    this.phone = "",
    this.total = 1,
    this.items,
  });

  String address;
  String phone;
  double total;
  String items;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        address: json["address"],
        phone: json["phone"],
        total: json["total"],
        items: json["items"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "phone": phone,
        "total": total,
        "items": items,
      };
}
