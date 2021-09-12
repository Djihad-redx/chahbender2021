// To parse this JSON data, do
//
//     final provinceInfo = provinceInfoFromJson(jsonString);

import 'dart:convert';

ProvinceInfo provinceInfoFromJson(String str) => ProvinceInfo.fromJson(json.decode(str));

String provinceInfoToJson(ProvinceInfo data) => json.encode(data.toJson());

class ProvinceInfo {
  ProvinceInfo({
    this.success,
    this.data,
  });

  bool success;
  Data data;

  factory ProvinceInfo.fromJson(Map<String, dynamic> json) => ProvinceInfo(
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
    this.provinces,
  });

  List<Province> provinces;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    provinces: List<Province>.from(json["provinces"].map((x) => Province.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "provinces": List<dynamic>.from(provinces.map((x) => x.toJson())),
  };
}

class Province {
  Province({
    this.district,
    this.id,
    this.province,
    this.country,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  List<District> district;
  String id;
  String province;
  String country;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Province.fromJson(Map<String, dynamic> json) => Province(
    district: List<District>.from(json["district"].map((x) => District.fromJson(x))),
    id: json["_id"],
    province: json["province"],
    country: json["country"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "district": List<dynamic>.from(district.map((x) => x.toJson())),
    "_id": id,
    "province": province,
    "country": country,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

class District {
  District({
    this.id,
    this.district,
  });

  String id;
  String district;

  factory District.fromJson(Map<String, dynamic> json) => District(
    id: json["_id"],
    district: json["district"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "district": district,
  };
}
