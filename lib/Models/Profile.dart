// To parse this JSON data, do
//
//     final userProfile = userProfileFromJson(jsonString);

import 'dart:convert';

UserProfile userProfileFromJson(String str) => UserProfile.fromJson(json.decode(str));

String userProfileToJson(UserProfile data) => json.encode(data.toJson());

class UserProfile {
  UserProfile({
    this.success,
    this.data,
  });

  bool success;
  Data data;

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
    success: json["success"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.userInfo,
    this.address,
  });

  UserInfo userInfo;
  List<DataAddress> address;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userInfo: UserInfo.fromJson(json["userInfo"]),
    address: List<DataAddress>.from(json["address"].map((x) => DataAddress.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "userInfo": userInfo.toJson(),
    "address": List<dynamic>.from(address.map((x) => x.toJson())),
  };
}

class DataAddress {
  DataAddress({
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
  List<AddressAddress> address;
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

  factory DataAddress.fromJson(Map<String, dynamic> json) => DataAddress(
    phone: json["phone"],
    address: List<AddressAddress>.from(json["address"].map((x) => AddressAddress.fromJson(x))),
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
    "address": List<dynamic>.from(address.map((x) => x.toJson())),
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

class AddressAddress {
  AddressAddress({
    this.address2,
    this.addressType,
    this.id,
    this.nameAddresses,
    this.firstName,
    this.lastName,
    this.phone,
    this.customer,
    this.location,
    this.address1,
    this.zipCode,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.addressId,
  });

  String address2;
  String addressType;
  String id;
  String nameAddresses;
  String firstName;
  String lastName;
  String phone;
  String customer;
  Location location;
  String address1;
  String zipCode;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String addressId;

  factory AddressAddress.fromJson(Map<String, dynamic> json) => AddressAddress(
    address2: json["address2"],
    addressType: json["addressType"],
    id: json["_id"],
    nameAddresses: json["nameAddresses"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    phone: json["phone"],
    customer: json["customer"],
    location: Location.fromJson(json["location"]),
    address1: json["address1"],
    zipCode: json["zipCode"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    addressId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "address2": address2,
    "addressType": addressType,
    "_id": id,
    "nameAddresses": nameAddresses,
    "firstName": firstName,
    "lastName": lastName,
    "phone": phone,
    "customer": customer,
    "location": location.toJson(),
    "address1": address1,
    "zipCode": zipCode,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "id": addressId,
  };
}

class Location {
  Location({
    this.country,
    this.province,
    this.district,
    this.id,
  });

  Country country;
  Country province;
  Country district;
  String id;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    country: Country.fromJson(json["country"]),
    province: Country.fromJson(json["province"]),
    district: Country.fromJson(json["district"]),
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "country": country.toJson(),
    "province": province.toJson(),
    "district": district.toJson(),
    "_id": id,
  };
}

class Country {
  Country({
    this.id,
    this.name,
  });

  String id;
  String name;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
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

class UserInfo {
  UserInfo({
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
  List<String> address;
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

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    phone: json["phone"],
    address: List<String>.from(json["address"].map((x) => x)),
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
