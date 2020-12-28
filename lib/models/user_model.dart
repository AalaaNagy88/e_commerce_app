import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.id="",
    this.name="",
    this.email="",
    this.address="",
    this.phone="",
    this.cartId="",
    this.orderId="",
  });

  String id;
  String name;
  String email;
  String address;
  String phone;
  String cartId;
  String orderId;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    address: json["address"],
    phone: json["phone"],
    cartId: json["cartId"],
    orderId: json["OrderId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "address": address,
    "phone": phone,
    "cartId": cartId,
    "OrderId": orderId,
  };
}
