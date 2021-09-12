// To parse this JSON data, do
//
//     final cartitem = cartitemFromJson(jsonString);

import 'dart:convert';

Cartitem cartitemFromJson(String str) => Cartitem.fromJson(json.decode(str));

String cartitemToJson(Cartitem data) => json.encode(data.toJson());

class Cartitem {
  Cartitem({
    this.success,
    this.data,
  });

  bool success;
  Data data;

  factory Cartitem.fromJson(Map<String, dynamic> json) => Cartitem(
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
    this.cartItems,
   // this.totalOfAllItemsInCartPrice,
  });

  CatItems cartItems;
 // int totalOfAllItemsInCartPrice;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    cartItems: CatItems.fromJson(json["cartItems"]),
   // totalOfAllItemsInCartPrice: json["totalOfAllItemsInCartPrice"],
  );

  Map<String, dynamic> toJson() => {
    "cartItems": cartItems.toJson(),
   // "totalOfAllItemsInCartPrice": totalOfAllItemsInCartPrice,
  };
}

class CatItems {
  CatItems({
    this.active,
    this.totalQty,
    this.totalCost,
    this.id,
    this.userId,
    this.items,
    this.modifiedOn,
    this.createdAt,
    this.updatedAt,
    this.v,


  });

  bool active;
  int totalQty;
  int totalCost;
  String id;
  String userId;
  List<Item> items;
  DateTime modifiedOn;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory CatItems.fromJson(Map<String, dynamic> json) => CatItems(
    active: json["active"],
    totalQty: json["totalQty"],
    totalCost: json["totalCost"],
    id: json["_id"],
    userId: json["userId"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    modifiedOn: DateTime.parse(json["modifiedOn"]),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "active": active,
    "totalQty": totalQty,
    "totalCost": totalCost,
    "_id": id,
    "userId": userId,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "modifiedOn": modifiedOn.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

class Item {
  Item({
    this.currency,
    this.id,
    this.productId,
    this.name,
    this.quantity,
    this.price,
    this.totalPrice,
    this.totalQuantity,
    this.productPictureUrl,
  });

  String currency;
  String id;
  String productId;
  String name;
  int quantity;
  double price;
  double totalPrice;
  int totalQuantity;
  String productPictureUrl;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    currency: json["currency"],
    id: json["_id"],
    productId: json["productId"],
    name: json["name"],
    quantity: json["quantity"],
    price: json["price"].toDouble(),
    totalPrice: json["totalPrice"].toDouble(),
    totalQuantity: json["totalQuantity"],
    productPictureUrl: json["productPictureUrl"],
  );

  Map<String, dynamic> toJson() => {
    "currency": currency,
    "_id": id,
    "productId": productId,
    "name": name,
    "quantity": quantity,
    "price": price,
    "totalPrice": totalPrice,
    "totalQuantity": totalQuantity,
    "productPictureUrl": productPictureUrl,
  };
}
