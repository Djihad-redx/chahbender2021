// To parse this JSON data, do
//
//     final locationInfo = locationInfoFromJson(jsonString);

import 'dart:convert';

LocationInfo locationInfoFromJson(String str) => LocationInfo.fromJson(json.decode(str));

String locationInfoToJson(LocationInfo data) => json.encode(data.toJson());

class LocationInfo {
  LocationInfo({
    this.success,
    this.data,
  });

  bool success;
  Data data;

  factory LocationInfo.fromJson(Map<String, dynamic> json) => LocationInfo(
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
    this.countries,
  });

  List<Country> countries;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    countries: List<Country>.from(json["countries"].map((x) => Country.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
  };
}

class Country {
  Country({
    this.provinces,
    this.published,
    this.id,
    this.countryName,
    this.code,
    this.v,
  });

  List<Province> provinces;
  bool published;
  String id;
  String countryName;
  String code;
  int v;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    provinces: List<Province>.from(json["provinces"].map((x) => Province.fromJson(x))),
    published: json["published"],
    id: json["_id"],
    countryName: json["countryName"],
    code: json["code"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "provinces": List<dynamic>.from(provinces.map((x) => x.toJson())),
    "published": published,
    "_id": id,
    "countryName": countryName,
    "code": code,
    "__v": v,
  };
}

class Province {
  Province({
    this.district,
    this.id,
    this.province,
  });

  List<District> district;
  String id;
  String province;

  factory Province.fromJson(Map<String, dynamic> json) => Province(
    district: List<District>.from(json["district"].map((x) => District.fromJson(x))),
    id: json["_id"],
    province: json["province"],
  );

  Map<String, dynamic> toJson() => {
    "district": List<dynamic>.from(district.map((x) => x.toJson())),
    "_id": id,
    "province": province,
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
