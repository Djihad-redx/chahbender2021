// To parse this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

import 'dart:convert';

Categories categoriesFromJson(String str) => Categories.fromJson(json.decode(str));

String categoriesToJson(Categories data) => json.encode(data.toJson());

class Categories {
  Categories({
    this.success,
    this.data,
  });

  bool success;
  Data data;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
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
    this.menuCategory,
    this.slideOffers,
    this.currencies,
    this.language,
    this.localStringResource,
    this.manufactures,
    this.seasonalOffers,
    this.dailyOffers,
    this.listCategoryOfProducts,
    this.countries,
  });

  List<MenuCategory> menuCategory;
  List<SlideOffer> slideOffers;
  List<CurrencyElement> currencies;
  List<Language> language;
  List<LocalStringResource> localStringResource;
  List<ManufactureElement> manufactures;
  List<Offer> seasonalOffers;
  List<Offer> dailyOffers;
  List<ListCategoryOfProduct> listCategoryOfProducts;
  List<Country> countries;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    menuCategory: List<MenuCategory>.from(json["menuCategory"].map((x) => MenuCategory.fromJson(x))),
    slideOffers: List<SlideOffer>.from(json["slideOffers"].map((x) => SlideOffer.fromJson(x))),
    currencies: List<CurrencyElement>.from(json["currencies"].map((x) => CurrencyElement.fromJson(x))),
    language: List<Language>.from(json["language"].map((x) => Language.fromJson(x))),
    localStringResource: List<LocalStringResource>.from(json["localStringResource"].map((x) => LocalStringResource.fromJson(x))),
    manufactures: List<ManufactureElement>.from(json["manufactures"].map((x) => ManufactureElement.fromJson(x))),
    seasonalOffers: List<Offer>.from(json["seasonalOffers"].map((x) => Offer.fromJson(x))),
    dailyOffers: List<Offer>.from(json["dailyOffers"].map((x) => Offer.fromJson(x))),
    listCategoryOfProducts: List<ListCategoryOfProduct>.from(json["listCategoryOfProducts"].map((x) => ListCategoryOfProduct.fromJson(x))),
    countries: List<Country>.from(json["countries"].map((x) => Country.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "menuCategory": List<dynamic>.from(menuCategory.map((x) => x.toJson())),
    "slideOffers": List<dynamic>.from(slideOffers.map((x) => x.toJson())),
    "currencies": List<dynamic>.from(currencies.map((x) => x.toJson())),
    "language": List<dynamic>.from(language.map((x) => x.toJson())),
    "localStringResource": List<dynamic>.from(localStringResource.map((x) => x.toJson())),
    "manufactures": List<dynamic>.from(manufactures.map((x) => x.toJson())),
    "seasonalOffers": List<dynamic>.from(seasonalOffers.map((x) => x.toJson())),
    "dailyOffers": List<dynamic>.from(dailyOffers.map((x) => x.toJson())),
    "listCategoryOfProducts": List<dynamic>.from(listCategoryOfProducts.map((x) => x.toJson())),
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

class CurrencyElement {
  CurrencyElement({
    this.published,
    this.rate,
    this.displayOrder,
    this.displayLocals,
    this.id,
    this.code,
    this.name,
    this.symbol,
    this.locals,
    this.createOnUtc,
    this.updateOnUtc,
    this.v,
  });

  bool published;
  double rate;
  int displayOrder;
  String displayLocals;
  String id;
  String code;
  String name;
  String symbol;
  List<dynamic> locals;
  DateTime createOnUtc;
  DateTime updateOnUtc;
  int v;

  factory CurrencyElement.fromJson(Map<String, dynamic> json) => CurrencyElement(
    published: json["published"],
    rate: json["rate"].toDouble(),
    displayOrder: json["displayOrder"],
    displayLocals: json["displayLocals"],
    id: json["_id"],
    code: json["code"],
    name: json["name"],
    symbol: json["symbol"],
    locals: List<dynamic>.from(json["Locals"].map((x) => x)),
    createOnUtc: DateTime.parse(json["createOnUtc"]),
    updateOnUtc: DateTime.parse(json["updateOnUtc"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "published": published,
    "rate": rate,
    "displayOrder": displayOrder,
    "displayLocals": displayLocals,
    "_id": id,
    "code": code,
    "name": name,
    "symbol": symbol,
    "Locals": List<dynamic>.from(locals.map((x) => x)),
    "createOnUtc": createOnUtc.toIso8601String(),
    "updateOnUtc": updateOnUtc.toIso8601String(),
    "__v": v,
  };
}

class Offer {
  Offer({
    this.name,
    this.price,
    this.currency,
    this.description,
    this.shortDescriptions,
    this.uniqueSeoCode,
    this.category,
    this.rating,
    this.picture,
  });

  String name;
  int price;
  String currency;
  String description;
  String shortDescriptions;
  UniqueSeoCode uniqueSeoCode;
  String category;
  double rating;
  List<PictureElement> picture;

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
    name: json["name"],
    price: json["price"],
    currency: json["currency"],
    description: json["description"],
    shortDescriptions: json["shortDescriptions"],
    uniqueSeoCode: uniqueSeoCodeValues.map[json["uniqueSeoCode"]],
    category: json["category"],
    rating: json["rating"].toDouble(),
    picture: json["picture"] == null ? null : List<PictureElement>.from(json["picture"].map((x) => PictureElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "price": price,
    "currency": currency,
    "description": description,
    "shortDescriptions": shortDescriptions,
    "uniqueSeoCode": uniqueSeoCodeValues.reverse[uniqueSeoCode],
    "category": category,
    "rating": rating,
    "picture": picture == null ? null : List<dynamic>.from(picture.map((x) => x.toJson())),
  };
}

enum CurrencyEnum { USD }

final currencyEnumValues = EnumValues({
  "USD": CurrencyEnum.USD
});

class PictureElement {
  PictureElement({
    this.pictureId,
    this.displayOrder,
    this.url,
    this.originalname,
    this.id,
  });

  String pictureId;
  int displayOrder;
  String url;
  String originalname;
  String id;

  factory PictureElement.fromJson(Map<String, dynamic> json) => PictureElement(
    pictureId: json["pictureId"],
    displayOrder: json["displayOrder"],
    url: json["url"],
    originalname: json["originalname"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "pictureId": pictureId,
    "displayOrder": displayOrder,
    "url": url,
    "originalname": originalname,
    "_id": id,
  };
}

enum UniqueSeoCode { EN }

final uniqueSeoCodeValues = EnumValues({
  "en": UniqueSeoCode.EN
});

class Language {
  Language({
    this.languageCulture,
    this.rtlLanguage,
    this.published,
    this.defaultCurrency,
    this.displayOrder,
    this.id,
    this.name,
    this.uniqueSeoCode,
    this.locals,
    this.createOnUtc,
    this.updateOnUtc,
    this.v,
  });

  String languageCulture;
  bool rtlLanguage;
  bool published;
  List<CurrencyElement> defaultCurrency;
  int displayOrder;
  String id;
  String name;
  String uniqueSeoCode;
  List<dynamic> locals;
  DateTime createOnUtc;
  DateTime updateOnUtc;
  int v;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
    languageCulture: json["languageCulture"],
    rtlLanguage: json["RtlLanguage"],
    published: json["published"],
    defaultCurrency: List<CurrencyElement>.from(json["defaultCurrency"].map((x) => CurrencyElement.fromJson(x))),
    displayOrder: json["displayOrder"],
    id: json["_id"],
    name: json["name"],
    uniqueSeoCode: json["uniqueSeoCode"],
    locals: List<dynamic>.from(json["Locals"].map((x) => x)),
    createOnUtc: DateTime.parse(json["createOnUtc"]),
    updateOnUtc: DateTime.parse(json["updateOnUtc"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "languageCulture": languageCulture,
    "RtlLanguage": rtlLanguage,
    "published": published,
    "defaultCurrency": List<dynamic>.from(defaultCurrency.map((x) => x.toJson())),
    "displayOrder": displayOrder,
    "_id": id,
    "name": name,
    "uniqueSeoCode": uniqueSeoCode,
    "Locals": List<dynamic>.from(locals.map((x) => x)),
    "createOnUtc": createOnUtc.toIso8601String(),
    "updateOnUtc": updateOnUtc.toIso8601String(),
    "__v": v,
  };
}

class ListCategoryOfProduct {
  ListCategoryOfProduct({
    this.id,
    this.name,
    this.defaultLanguage,
    this.products,
  });

  String id;
  String name;
  UniqueSeoCode defaultLanguage;
  List<List<Product>> products;

  factory ListCategoryOfProduct.fromJson(Map<String, dynamic> json) => ListCategoryOfProduct(
    id: json["id"],
    name: json["name"],
    defaultLanguage: uniqueSeoCodeValues.map[json["defaultLanguage"]],
    products: List<List<Product>>.from(json["Products"].map((x) => List<Product>.from(x.map((x) => Product.fromJson(x))))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "defaultLanguage": uniqueSeoCodeValues.reverse[defaultLanguage],
    "Products": List<dynamic>.from(products.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
  };
}

class Product {
  Product({
    this.id,
    this.name,
    this.price,
    this.currency,
    this.picture,
    this.shortDescriptions,
    this.rating,
    this.uniqueSeoCode,
    this.discount,
  });

  String id;
  String name;
  double price;
  String currency;
  List<PictureElement> picture;
  String shortDescriptions;
  double rating;
  UniqueSeoCode uniqueSeoCode;
  ShortDescriptions discount;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    price: json["price"].toDouble(),
    currency: json["currency"],
    picture: List<PictureElement>.from(json["picture"].map((x) => PictureElement.fromJson(x))),
    shortDescriptions: json["shortDescriptions"],
    rating: json["rating"].toDouble(),
    uniqueSeoCode: uniqueSeoCodeValues.map[json["uniqueSeoCode"]],
    discount: shortDescriptionsValues.map[json["discount"]],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "currency": currency,
    "picture": List<dynamic>.from(picture.map((x) => x.toJson())),
    "shortDescriptions": shortDescriptions,
    "rating": rating,
    "uniqueSeoCode": uniqueSeoCodeValues.reverse[uniqueSeoCode],
    "discount": shortDescriptionsValues.reverse[discount],
  };
}

enum ShortDescriptions { SEASONAL_OFFERS, EMPTY, DAILY_OFFERS }

final shortDescriptionsValues = EnumValues({
  "Daily Offers": ShortDescriptions.DAILY_OFFERS,
  " ": ShortDescriptions.EMPTY,
  "Seasonal Offers": ShortDescriptions.SEASONAL_OFFERS
});

class LocalStringResource {
  LocalStringResource({
    this.id,
    this.published,
    this.languageId,
    this.uniqueSeoCode,
    this.resourceName,
    this.resourceValue,
    this.v,
  });

  String id;
  bool published;
  String languageId;
  UniqueSeoCode uniqueSeoCode;
  String resourceName;
  String resourceValue;
  int v;

  factory LocalStringResource.fromJson(Map<String, dynamic> json) => LocalStringResource(
    id: json["_id"],
    published: json["published"],
    languageId: json["languageId"],
    uniqueSeoCode: uniqueSeoCodeValues.map[json["uniqueSeoCode"]],
    resourceName: json["resourceName"],
    resourceValue: json["resourceValue"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "published": published,
    "languageId": languageId,
    "uniqueSeoCode": uniqueSeoCodeValues.reverse[uniqueSeoCode],
    "resourceName": resourceName,
    "resourceValue": resourceValue,
    "__v": v,
  };
}

class ManufactureElement {
  ManufactureElement({
    this.includeInTopMenu,
    this.languageId,
    this.uniqueSeoCode,
    this.id,
    this.name,
  });

  bool includeInTopMenu;
  String languageId;
  UniqueSeoCode uniqueSeoCode;
  String id;
  String name;

  factory ManufactureElement.fromJson(Map<String, dynamic> json) => ManufactureElement(
    includeInTopMenu: json["includeInTopMenu"],
    languageId: json["languageId"],
    uniqueSeoCode: uniqueSeoCodeValues.map[json["uniqueSeoCode"]],
    id: json["_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "includeInTopMenu": includeInTopMenu,
    "languageId": languageId,
    "uniqueSeoCode": uniqueSeoCodeValues.reverse[uniqueSeoCode],
    "_id": id,
    "name": name,
  };
}

class MenuCategory {
  MenuCategory({
    this.name,
    this.locals,
    this.id,
    this.children,
    this.isSelected
  });

  String name;
  List<MenuCategoryLocal> locals;
  String id;
  List<Child> children;
  bool isSelected = false;

  factory MenuCategory.fromJson(Map<String, dynamic> json) => MenuCategory(
    name: json["name"],
    locals: List<MenuCategoryLocal>.from(json["Locals"].map((x) => MenuCategoryLocal.fromJson(x))),
    id: json["id"],
    children: List<Child>.from(json["children"].map((x) => Child.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "Locals": List<dynamic>.from(locals.map((x) => x.toJson())),
    "id": id,
    "children": List<dynamic>.from(children.map((x) => x.toJson())),
  };
}

class Child {
  Child({
    this.picture,
    this.showOnHomePage,
    this.published,
    this.id,
    this.name,
    this.parent,
    this.ancestors,
    this.locals,
  });

  LocalPicture picture;
  bool showOnHomePage;
  bool published;
  String id;
  String name;
  String parent;
  List<ChildAncestor> ancestors;
  List<MenuCategoryLocal> locals;

  factory Child.fromJson(Map<String, dynamic> json) => Child(
    picture: LocalPicture.fromJson(json["picture"]),
    showOnHomePage: json["showOnHomePage"],
    published: json["published"],
    id: json["_id"],
    name: json["name"],
    parent: json["parent"],
    ancestors: List<ChildAncestor>.from(json["ancestors"].map((x) => ChildAncestor.fromJson(x))),
    locals: List<MenuCategoryLocal>.from(json["Locals"].map((x) => MenuCategoryLocal.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "picture": picture.toJson(),
    "showOnHomePage": showOnHomePage,
    "published": published,
    "_id": id,
    "name": name,
    "parent": parent,
    "ancestors": List<dynamic>.from(ancestors.map((x) => x.toJson())),
    "Locals": List<dynamic>.from(locals.map((x) => x.toJson())),
  };
}

class ChildAncestor {
  ChildAncestor({
    this.name,
    this.slug,
  });

  String name;
  String slug;

  factory ChildAncestor.fromJson(Map<String, dynamic> json) => ChildAncestor(
    name: json["name"],
    slug: json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "slug": slug,
  };
}

class MenuCategoryLocal {
  MenuCategoryLocal({
    this.picture,
    this.name,
    this.mainCategory,
    this.parentCategoryId,
    this.pageSize,
    this.priceRange,
    this.showOnHomePage,
    this.featureProductOnHomePage,
    this.includeInTopMenu,
    this.limitedToStore,
    this.published,
    this.displayOrder,
    this.ancestors,
    this.createOnUtc,
    this.id,
    this.languageId,
    this.uniqueSeoCode,
    this.description,
  });

  LocalPicture picture;
  String name;
  bool mainCategory;
  dynamic parentCategoryId;
  int pageSize;
  String priceRange;
  bool showOnHomePage;
  bool featureProductOnHomePage;
  bool includeInTopMenu;
  bool limitedToStore;
  bool published;
  int displayOrder;
  List<LocalAncestor> ancestors;
  DateTime createOnUtc;
  String id;
  LanguageId languageId;
  LocalUniqueSeoCode uniqueSeoCode;
  Description description;

  factory MenuCategoryLocal.fromJson(Map<String, dynamic> json) => MenuCategoryLocal(
    picture: LocalPicture.fromJson(json["picture"]),
    name: json["name"],
    mainCategory: json["mainCategory"],
    parentCategoryId: json["parentCategoryId"],
    pageSize: json["pageSize"],
    priceRange: json["priceRange"],
    showOnHomePage: json["showOnHomePage"],
    featureProductOnHomePage: json["featureProductOnHomePage"],
    includeInTopMenu: json["IncludeInTopMenu"],
    limitedToStore: json["limitedToStore"],
    published: json["published"],
    displayOrder: json["displayOrder"],
    ancestors: List<LocalAncestor>.from(json["ancestors"].map((x) => LocalAncestor.fromJson(x))),
    createOnUtc: DateTime.parse(json["createOnUtc"]),
    id: json["_id"],
    languageId: languageIdValues.map[json["languageId"]],
    uniqueSeoCode: localUniqueSeoCodeValues.map[json["uniqueSeoCode"]],
    description: descriptionValues.map[json["description"]],
  );

  Map<String, dynamic> toJson() => {
    "picture": picture.toJson(),
    "name": name,
    "mainCategory": mainCategory,
    "parentCategoryId": parentCategoryId,
    "pageSize": pageSize,
    "priceRange": priceRange,
    "showOnHomePage": showOnHomePage,
    "featureProductOnHomePage": featureProductOnHomePage,
    "IncludeInTopMenu": includeInTopMenu,
    "limitedToStore": limitedToStore,
    "published": published,
    "displayOrder": displayOrder,
    "ancestors": List<dynamic>.from(ancestors.map((x) => x.toJson())),
    "createOnUtc": createOnUtc.toIso8601String(),
    "_id": id,
    "languageId": languageIdValues.reverse[languageId],
    "uniqueSeoCode": localUniqueSeoCodeValues.reverse[uniqueSeoCode],
    "description": descriptionValues.reverse[description],
  };
}

class LocalAncestor {
  LocalAncestor({
    this.id,
    this.name,
    this.slug,
  });

  String id;
  String name;
  String slug;

  factory LocalAncestor.fromJson(Map<String, dynamic> json) => LocalAncestor(
    id: json["_id"],
    name: json["name"],
    slug: json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "slug": slug,
  };
}

enum Description { EMPTY }

final descriptionValues = EnumValues({
  "هذا اختبار للغة للعربية ": Description.EMPTY
});

enum LanguageId { THE_5_FF22_ED18_E48873_F6_C6_E711_D }

final languageIdValues = EnumValues({
  "5ff22ed18e48873f6c6e711d": LanguageId.THE_5_FF22_ED18_E48873_F6_C6_E711_D
});

class LocalPicture {
  LocalPicture({
    this.pictureId,
    this.url,
    this.originalname,
    this.displayOrder,
  });

  String pictureId;
  String url;
  Originalname originalname;
  int displayOrder;

  factory LocalPicture.fromJson(Map<String, dynamic> json) => LocalPicture(
    pictureId: json["pictureId"],
    url: json["url"],
    originalname: originalnameValues.map[json["originalname"]],
    displayOrder: json["displayOrder"] == null ? null : json["displayOrder"],
  );

  Map<String, dynamic> toJson() => {
    "pictureId": pictureId,
    "url": url,
    "originalname": originalnameValues.reverse[originalname],
    "displayOrder": displayOrder == null ? null : displayOrder,
  };
}

enum Originalname { EMPTY, WEEKEND_JPG }

final originalnameValues = EnumValues({
  "": Originalname.EMPTY,
  "weekend.jpg": Originalname.WEEKEND_JPG
});

enum LocalUniqueSeoCode { QA }

final localUniqueSeoCodeValues = EnumValues({
  "QA": LocalUniqueSeoCode.QA
});

class SlideOffer {
  SlideOffer({
    this.picture,
    this.discount,
    this.shortDescriptions,
    this.showOnHomePage,
    this.displayOrder,
    this.typeOfOffers,
    this.productsListId,
    this.categoryId,
    this.manufacture,
    this.languageId,
    this.uniqueSeoCode,
    this.published,
    this.id,
    this.manfucters,
    this.name,
    this.startDate,
    this.endDate,
    this.createOnUtc,
    this.updateOnUtc,
    this.slug,
    this.locals,
    this.v,
  });

  LocalPicture picture;
  SlideOfferDiscount discount;
  ShortDescriptions shortDescriptions;
  bool showOnHomePage;
  int displayOrder;
  String typeOfOffers;
  List<ProductsListId> productsListId;
  String categoryId;
  dynamic manufacture;
  String languageId;
  UniqueSeoCode uniqueSeoCode;
  bool published;
  String id;
  dynamic manfucters;
  String name;
  DateTime startDate;
  DateTime endDate;
  DateTime createOnUtc;
  DateTime updateOnUtc;
  String slug;
  List<dynamic> locals;
  int v;

  factory SlideOffer.fromJson(Map<String, dynamic> json) => SlideOffer(
    picture: LocalPicture.fromJson(json["picture"]),
    discount: SlideOfferDiscount.fromJson(json["discount"]),
    shortDescriptions: shortDescriptionsValues.map[json["shortDescriptions"]],
    showOnHomePage: json["showOnHomePage"],
    displayOrder: json["displayOrder"],
    typeOfOffers: json["typeOfOffers"],
    productsListId: List<ProductsListId>.from(json["productsListId"].map((x) => ProductsListId.fromJson(x))),
    categoryId: json["categoryId"],
    manufacture: json["manufacture"],
    languageId: json["languageId"],
    uniqueSeoCode: uniqueSeoCodeValues.map[json["uniqueSeoCode"]],
    published: json["published"],
    id: json["_id"],
    manfucters: json["manfucters"],
    name: json["name"],
    startDate: DateTime.parse(json["startDate"]),
    endDate: DateTime.parse(json["endDate"]),
    createOnUtc: DateTime.parse(json["createOnUtc"]),
    updateOnUtc: DateTime.parse(json["updateOnUtc"]),
    slug: json["slug"],
    locals: List<dynamic>.from(json["Locals"].map((x) => x)),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "picture": picture.toJson(),
    "discount": discount.toJson(),
    "shortDescriptions": shortDescriptionsValues.reverse[shortDescriptions],
    "showOnHomePage": showOnHomePage,
    "displayOrder": displayOrder,
    "typeOfOffers": typeOfOffers,
    "productsListId": List<dynamic>.from(productsListId.map((x) => x.toJson())),
    "categoryId": categoryId,
    "manufacture": manufacture,
    "languageId": languageId,
    "uniqueSeoCode": uniqueSeoCodeValues.reverse[uniqueSeoCode],
    "published": published,
    "_id": id,
    "manfucters": manfucters,
    "name": name,
    "startDate": startDate.toIso8601String(),
    "endDate": endDate.toIso8601String(),
    "createOnUtc": createOnUtc.toIso8601String(),
    "updateOnUtc": updateOnUtc.toIso8601String(),
    "slug": slug,
    "Locals": List<dynamic>.from(locals.map((x) => x)),
    "__v": v,
  };
}

class SlideOfferDiscount {
  SlideOfferDiscount({
    this.discountId,
    this.name,
    this.offerId,
  });

  String discountId;
  ShortDescriptions name;
  String offerId;

  factory SlideOfferDiscount.fromJson(Map<String, dynamic> json) => SlideOfferDiscount(
    discountId: json["discountId"],
    name: shortDescriptionsValues.map[json["name"]],
    offerId: json["offerId"],
  );

  Map<String, dynamic> toJson() => {
    "discountId": discountId,
    "name": shortDescriptionsValues.reverse[name],
    "offerId": offerId,
  };
}

class ProductsListId {
  ProductsListId({
    this.productsCategory,
    this.discount,
    this.manufacture,
    this.shortDescriptions,
    this.description,
    this.type,
    this.rating,
    this.reviews,
    this.languageId,
    this.uniqueSeoCode,
    this.isRecurring,
    this.stock,
    this.orderMinimumQuantity,
    this.orderMaximumQuantity,
    this.publish,
    this.showOnHomePage,
    this.displayOrder,
    this.displayOrderCategory,
    this.isDeleted,
    this.vendorId,
    this.id,
    this.name,
    this.price,
    this.relatedProduct,
    this.corssSellProduct,
    this.productsAttributes,
    this.productSpecificationsAttribute,
    this.createOnUtc,
    this.productPicture,
    this.offers,
    this.locals,
    this.updateOnUtc,
    this.slug,
    this.v,
    this.productsListIdId,
  });

  ProductsCategory productsCategory;
  ProductsListIdDiscount discount;
  ProductsListIdManufacture manufacture;
  String shortDescriptions;
  String description;
  String type;
  double rating;
  List<String> reviews;
  String languageId;
  UniqueSeoCode uniqueSeoCode;
  bool isRecurring;
  dynamic stock;
  int orderMinimumQuantity;
  int orderMaximumQuantity;
  bool publish;
  bool showOnHomePage;
  int displayOrder;
  int displayOrderCategory;
  bool isDeleted;
  String vendorId;
  String id;
  String name;
  List<Price> price;
  List<RelatedProduct> relatedProduct;
  List<dynamic> corssSellProduct;
  List<dynamic> productsAttributes;
  List<ProductSpecificationsAttribute> productSpecificationsAttribute;
  DateTime createOnUtc;
  List<PictureElement> productPicture;
  List<dynamic> offers;
  List<ProductsListIdLocal> locals;
  DateTime updateOnUtc;
  String slug;
  int v;
  String productsListIdId;

  factory ProductsListId.fromJson(Map<String, dynamic> json) => ProductsListId(
    productsCategory: ProductsCategory.fromJson(json["productsCategory"]),
    discount: ProductsListIdDiscount.fromJson(json["discount"]),
    manufacture: ProductsListIdManufacture.fromJson(json["manufacture"]),
    shortDescriptions: json["shortDescriptions"],
    description: json["description"],
    type: json["type"],
    rating: json["rating"].toDouble(),
    reviews: List<String>.from(json["reviews"].map((x) => x)),
    languageId: json["languageId"],
    uniqueSeoCode: uniqueSeoCodeValues.map[json["uniqueSeoCode"]],
    isRecurring: json["isRecurring"],
    stock: json["stock"],
    orderMinimumQuantity: json["orderMinimumQuantity"],
    orderMaximumQuantity: json["orderMaximumQuantity"],
    publish: json["publish"],
    showOnHomePage: json["showOnHomePage"],
    displayOrder: json["displayOrder"],
    displayOrderCategory: json["displayOrderCategory"],
    isDeleted: json["isDeleted"],
    vendorId: json["vendorId"],
    id: json["_id"],
    name: json["name"],
    price: List<Price>.from(json["price"].map((x) => Price.fromJson(x))),
    relatedProduct: List<RelatedProduct>.from(json["relatedProduct"].map((x) => RelatedProduct.fromJson(x))),
    corssSellProduct: List<dynamic>.from(json["corssSellProduct"].map((x) => x)),
    productsAttributes: List<dynamic>.from(json["productsAttributes"].map((x) => x)),
    productSpecificationsAttribute: List<ProductSpecificationsAttribute>.from(json["productSpecificationsAttribute"].map((x) => ProductSpecificationsAttribute.fromJson(x))),
    createOnUtc: DateTime.parse(json["createOnUtc"]),
    productPicture: List<PictureElement>.from(json["productPicture"].map((x) => PictureElement.fromJson(x))),
    offers: List<dynamic>.from(json["offers"].map((x) => x)),
    locals: List<ProductsListIdLocal>.from(json["Locals"].map((x) => ProductsListIdLocal.fromJson(x))),
    updateOnUtc: DateTime.parse(json["updateOnUtc"]),
    slug: json["slug"],
    v: json["__v"],
    productsListIdId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "productsCategory": productsCategory.toJson(),
    "discount": discount.toJson(),
    "manufacture": manufacture.toJson(),
    "shortDescriptions": shortDescriptions,
    "description": description,
    "type": type,
    "rating": rating,
    "reviews": List<dynamic>.from(reviews.map((x) => x)),
    "languageId": languageId,
    "uniqueSeoCode": uniqueSeoCodeValues.reverse[uniqueSeoCode],
    "isRecurring": isRecurring,
    "stock": stock,
    "orderMinimumQuantity": orderMinimumQuantity,
    "orderMaximumQuantity": orderMaximumQuantity,
    "publish": publish,
    "showOnHomePage": showOnHomePage,
    "displayOrder": displayOrder,
    "displayOrderCategory": displayOrderCategory,
    "isDeleted": isDeleted,
    "vendorId": vendorId,
    "_id": id,
    "name": name,
    "price": List<dynamic>.from(price.map((x) => x.toJson())),
    "relatedProduct": List<dynamic>.from(relatedProduct.map((x) => x.toJson())),
    "corssSellProduct": List<dynamic>.from(corssSellProduct.map((x) => x)),
    "productsAttributes": List<dynamic>.from(productsAttributes.map((x) => x)),
    "productSpecificationsAttribute": List<dynamic>.from(productSpecificationsAttribute.map((x) => x.toJson())),
    "createOnUtc": createOnUtc.toIso8601String(),
    "productPicture": List<dynamic>.from(productPicture.map((x) => x.toJson())),
    "offers": List<dynamic>.from(offers.map((x) => x)),
    "Locals": List<dynamic>.from(locals.map((x) => x.toJson())),
    "updateOnUtc": updateOnUtc.toIso8601String(),
    "slug": slug,
    "__v": v,
    "id": productsListIdId,
  };
}

class ProductsListIdDiscount {
  ProductsListIdDiscount({
    this.discountId,
    this.name,
    this.productId,
  });

  String discountId;
  ShortDescriptions name;
  String productId;

  factory ProductsListIdDiscount.fromJson(Map<String, dynamic> json) => ProductsListIdDiscount(
    discountId: json["discountId"],
    name: shortDescriptionsValues.map[json["name"]],
    productId: json["productId"],
  );

  Map<String, dynamic> toJson() => {
    "discountId": discountId,
    "name": shortDescriptionsValues.reverse[name],
    "productId": productId,
  };
}

class ProductsListIdLocal {
  ProductsListIdLocal({
    this.name,
    this.shortDescriptions,
    this.description,
    this.id,
    this.languageId,
    this.uniqueSeoCode,
  });

  String name;
  String shortDescriptions;
  String description;
  String id;
  String languageId;
  String uniqueSeoCode;

  factory ProductsListIdLocal.fromJson(Map<String, dynamic> json) => ProductsListIdLocal(
    name: json["name"],
    shortDescriptions: json["shortDescriptions"],
    description: json["description"],
    id: json["_id"],
    languageId: json["languageId"],
    uniqueSeoCode: json["uniqueSeoCode"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "shortDescriptions": shortDescriptions,
    "description": description,
    "_id": id,
    "languageId": languageId,
    "uniqueSeoCode": uniqueSeoCode,
  };
}

class ProductsListIdManufacture {
  ProductsListIdManufacture({
    this.manufactureId,
    this.name,
  });

  String manufactureId;
  String name;

  factory ProductsListIdManufacture.fromJson(Map<String, dynamic> json) => ProductsListIdManufacture(
    manufactureId: json["manufactureId"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "manufactureId": manufactureId,
    "name": name,
  };
}

class Price {
  Price({
    this.currency,
    this.oldPrice,
    this.productCost,
    this.id,
    this.priceNow,
  });

  PriceCurrency currency;
  int oldPrice;
  int productCost;
  String id;
  int priceNow;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    currency: PriceCurrency.fromJson(json["currency"]),
    oldPrice: json["oldPrice"],
    productCost: json["productCost"],
    id: json["_id"],
    priceNow: json["priceNow"],
  );

  Map<String, dynamic> toJson() => {
    "currency": currency.toJson(),
    "oldPrice": oldPrice,
    "productCost": productCost,
    "_id": id,
    "priceNow": priceNow,
  };
}

class PriceCurrency {
  PriceCurrency({
    this.currencyId,
    this.code,
    this.name,
  });

  String currencyId;
  String code;
  String name;

  factory PriceCurrency.fromJson(Map<String, dynamic> json) => PriceCurrency(
    currencyId: json["currencyId"],
    code: json["code"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "currencyId": currencyId,
    "code": code,
    "name": name,
  };
}

class ProductSpecificationsAttribute {
  ProductSpecificationsAttribute({
    this.specificationAttributeId,
    this.productId,
    this.specificationAttributeOptionId,
  });

  String specificationAttributeId;
  String productId;
  String specificationAttributeOptionId;

  factory ProductSpecificationsAttribute.fromJson(Map<String, dynamic> json) => ProductSpecificationsAttribute(
    specificationAttributeId: json["SpecificationAttributeId"],
    productId: json["productId"],
    specificationAttributeOptionId: json["specificationAttributeOptionId"],
  );

  Map<String, dynamic> toJson() => {
    "SpecificationAttributeId": specificationAttributeId,
    "productId": productId,
    "specificationAttributeOptionId": specificationAttributeOptionId,
  };
}

class ProductsCategory {
  ProductsCategory({
    this.productId,
    this.categoryId,
    this.isFeaturedProduct,
    this.displayOrder,
  });

  String productId;
  String categoryId;
  bool isFeaturedProduct;
  int displayOrder;

  factory ProductsCategory.fromJson(Map<String, dynamic> json) => ProductsCategory(
    productId: json["productId"],
    categoryId: json["categoryId"],
    isFeaturedProduct: json["isFeaturedProduct"],
    displayOrder: json["displayOrder"],
  );

  Map<String, dynamic> toJson() => {
    "productId": productId,
    "categoryId": categoryId,
    "isFeaturedProduct": isFeaturedProduct,
    "displayOrder": displayOrder,
  };
}

class RelatedProduct {
  RelatedProduct({
    this.productId2,
    this.displayOrder,
    this.id,
  });

  String productId2;
  int displayOrder;
  String id;

  factory RelatedProduct.fromJson(Map<String, dynamic> json) => RelatedProduct(
    productId2: json["productId2"],
    displayOrder: json["displayOrder"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "productId2": productId2,
    "displayOrder": displayOrder,
    "_id": id,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
