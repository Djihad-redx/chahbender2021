// To parse this JSON data, do
//
//     final deleteAddress = deleteAddressFromJson(jsonString);

import 'dart:convert';

DeleteAddress deleteAddressFromJson(String str) => DeleteAddress.fromJson(json.decode(str));

String deleteAddressToJson(DeleteAddress data) => json.encode(data.toJson());

class DeleteAddress {
  DeleteAddress({
    this.success,
    this.data,
  });

  bool success;
  List<Datumum> data;

  factory DeleteAddress.fromJson(Map<String, dynamic> json) => DeleteAddress(
    success: json["success"],
    data: List<Datumum>.from(json["data"].map((x) => Datumum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datumum {
  Datumum({
    this.phone,
    this.address,
    this.role,
    this.roles,
    this.vendorId,
    this.storeId,
    this.active,
    this.tokens,
    this.id,
    this.name,
    this.lastName,
    this.email,
    this.paymentCard,
    this.createOnUtc,
    this.updateOnUtc,
    this.v,
  });

  String phone;
  List<dynamic> address;
  String role;
  String roles;
  dynamic vendorId;
  dynamic storeId;
  bool active;
  List<String> tokens;
  String id;
  String name;
  String lastName;
  String email;
  List<PaymentCard> paymentCard;
  DateTime createOnUtc;
  DateTime updateOnUtc;
  int v;

  factory Datumum.fromJson(Map<String, dynamic> json) => Datumum(
    phone: json["phone"],
    address: List<dynamic>.from(json["address"].map((x) => x)),
    role: json["role"],
    roles: json["roles"],
    vendorId: json["vendorId"],
    storeId: json["storeId"],
    active: json["active"],
    tokens: List<String>.from(json["tokens"].map((x) => x)),
    id: json["_id"],
    name: json["name"],
    lastName: json["lastName"],
    email: json["email"],
    paymentCard: List<PaymentCard>.from(json["paymentCard"].map((x) => PaymentCard.fromJson(x))),
    createOnUtc: DateTime.parse(json["createOnUtc"]),
    updateOnUtc: DateTime.parse(json["updateOnUtc"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "address": List<dynamic>.from(address.map((x) => x)),
    "role": role,
    "roles": roles,
    "vendorId": vendorId,
    "storeId": storeId,
    "active": active,
    "tokens": List<dynamic>.from(tokens.map((x) => x)),
    "_id": id,
    "name": name,
    "lastName": lastName,
    "email": email,
    "paymentCard": List<dynamic>.from(paymentCard.map((x) => x.toJson())),
    "createOnUtc": createOnUtc.toIso8601String(),
    "updateOnUtc": updateOnUtc.toIso8601String(),
    "__v": v,
  };
}

class PaymentCard {
  PaymentCard({
    this.registerCard,
    this.id,
    this.cardHolderName,
    this.cardNumber,
    this.expireMonth,
    this.expireYear,
    this.cvc,
  });

  String registerCard;
  String id;
  String cardHolderName;
  String cardNumber;
  String expireMonth;
  String expireYear;
  String cvc;

  factory PaymentCard.fromJson(Map<String, dynamic> json) => PaymentCard(
    registerCard: json["registerCard"],
    id: json["_id"],
    cardHolderName: json["cardHolderName"],
    cardNumber: json["cardNumber"],
    expireMonth: json["expireMonth"],
    expireYear: json["expireYear"],
    cvc: json["cvc"],
  );

  Map<String, dynamic> toJson() => {
    "registerCard": registerCard,
    "_id": id,
    "cardHolderName": cardHolderName,
    "cardNumber": cardNumber,
    "expireMonth": expireMonth,
    "expireYear": expireYear,
    "cvc": cvc,
  };
}
