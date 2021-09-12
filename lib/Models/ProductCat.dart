// To parse this JSON data, do
//
//     final productPageCat = productPageCatFromJson(jsonString);

import 'dart:convert';

ProductPageCat productPageCatFromJson(String str) => ProductPageCat.fromJson(json.decode(str));

String productPageCatToJson(ProductPageCat data) => json.encode(data.toJson());

class ProductPageCat {
  ProductPageCat({
    this.success,
    this.count,
    this.data,
  });

  bool success;
  int count;
  DataCat data;

  factory ProductPageCat.fromJson(Map<String, dynamic> json) => ProductPageCat(
    success: json["success"],
    count: json["count"],
    data: DataCat.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "count": count,
    "data": data.toJson(),
  };
}

class DataCat {
  DataCat({
    this.products,
    this.filter,
    this.ratingListCount,
  });

  List<Product> products;
  Filter filter;
  RatingListCount ratingListCount;

  factory DataCat.fromJson(Map<String, dynamic> json) => DataCat(
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    filter: Filter.fromJson(json["Filter"]),
    ratingListCount: RatingListCount.fromJson(json["RatingListCount"]),
  );
  factory DataCat.fromJson2(Map<String, dynamic> json) => DataCat(
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),

  );

  Map<String, dynamic> toJson() => {
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "Filter": filter.toJson(),
    "RatingListCount": ratingListCount.toJson(),
  };
  Map<String, dynamic> toJson2() => {
    "products": List<dynamic>.from(products.map((x) => x.toJson())),

  };


}

class Filter {
  Filter({
    this.filterProducts,
    this.categoryChilds,
    this.vendors,
  });

  List<FilterProduct> filterProducts;
  List<CategoryChild> categoryChilds;
  List<dynamic> vendors;

  factory Filter.fromJson(Map<String, dynamic> json) => Filter(
    filterProducts: List<FilterProduct>.from(json["FilterProducts"].map((x) => FilterProduct.fromJson(x))),
    categoryChilds: List<CategoryChild>.from(json["categoryChilds"].map((x) => CategoryChild.fromJson(x))),
    vendors: List<dynamic>.from(json["vendors"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "FilterProducts": List<dynamic>.from(filterProducts.map((x) => x.toJson())),
    "categoryChilds": List<dynamic>.from(categoryChilds.map((x) => x.toJson())),
    "vendors": List<dynamic>.from(vendors.map((x) => x)),
  };
}

class CategoryChild {
  CategoryChild({
    this.picture,
    this.showOnHomePage,
    this.published,
    this.id,
    this.name,
    this.parent,
    this.ancestors,
  });

  Picture picture;
  bool showOnHomePage;
  bool published;
  String id;
  String name;
  Parent parent;
  List<Ancestor> ancestors;

  factory CategoryChild.fromJson(Map<String, dynamic> json) => CategoryChild(
    picture: Picture.fromJson(json["picture"]),
    showOnHomePage: json["showOnHomePage"],
    published: json["published"],
    id: json["_id"],
    name: json["name"],
    parent: parentValues.map[json["parent"]],
    ancestors: List<Ancestor>.from(json["ancestors"].map((x) => Ancestor.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "picture": picture.toJson(),
    "showOnHomePage": showOnHomePage,
    "published": published,
    "_id": id,
    "name": name,
    "parent": parentValues.reverse[parent],
    "ancestors": List<dynamic>.from(ancestors.map((x) => x.toJson())),
  };
}

class Ancestor {
  Ancestor({
    this.name,
    this.slug,
  });

  Name name;
  Slug slug;

  factory Ancestor.fromJson(Map<String, dynamic> json) => Ancestor(
    name: nameValues.map[json["name"]],
    slug: slugValues.map[json["slug"]],
  );

  Map<String, dynamic> toJson() => {
    "name": nameValues.reverse[name],
    "slug": slugValues.reverse[slug],
  };
}

enum Name { JEWELRY, APPAREL_ACCESSORIES }

final nameValues = EnumValues({
  "Apparel & Accessories": Name.APPAREL_ACCESSORIES,
  "Jewelry": Name.JEWELRY
});

enum Slug { JEWELRY, APPAREL_AND_ACCESSORIES }

final slugValues = EnumValues({
  "apparel-and-accessories": Slug.APPAREL_AND_ACCESSORIES,
  "jewelry": Slug.JEWELRY
});

enum Parent { THE_5_FF435_B5_E2_F5_E77920_F549_D6 }

final parentValues = EnumValues({
  "5ff435b5e2f5e77920f549d6": Parent.THE_5_FF435_B5_E2_F5_E77920_F549_D6
});

class Picture {
  Picture({
    this.pictureId,
    this.url,
    this.originalname,
  });

  String pictureId;
  String url;
  String originalname;

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
    pictureId: json["pictureId"],
    url: json["url"],
    originalname: json["originalname"],
  );

  Map<String, dynamic> toJson() => {
    "pictureId": pictureId,
    "url": url,
    "originalname": originalname,
  };
}

class FilterProduct {
  FilterProduct({
    this.name,
    this.id,
    this.specificationAttributeOption,
  });

  String name;
  String id;
  List<SpecificationAttributeOption> specificationAttributeOption;

  factory FilterProduct.fromJson(Map<String, dynamic> json) => FilterProduct(
    name: json["name"],
    id: json["_id"],
    specificationAttributeOption: List<SpecificationAttributeOption>.from(json["SpecificationAttributeOption"].map((x) => SpecificationAttributeOption.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "_id": id,
    "SpecificationAttributeOption": List<dynamic>.from(specificationAttributeOption.map((x) => x.toJson())),
  };
}

class SpecificationAttributeOption {
  SpecificationAttributeOption({
    this.valueAttribute,
    this.colorSquaresRgb,
    this.specificationAttributeId,
    this.specificationAttributeOptionId,
  });

  String valueAttribute;
  dynamic colorSquaresRgb;
  String specificationAttributeId;
  String specificationAttributeOptionId;

  factory SpecificationAttributeOption.fromJson(Map<String, dynamic> json) => SpecificationAttributeOption(
    valueAttribute: json["valueAttribute"],
    colorSquaresRgb: json["colorSquaresRgb"],
    specificationAttributeId: json["specificationAttributeId"],
    specificationAttributeOptionId: json["specificationAttributeOptionId"],
  );

  Map<String, dynamic> toJson() => {
    "valueAttribute": valueAttribute,
    "colorSquaresRgb": colorSquaresRgb,
    "specificationAttributeId": specificationAttributeId,
    "specificationAttributeOptionId": specificationAttributeOptionId,
  };
}

class Product {
  Product({
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
    this.productId,
    this.quantity,
  });

  ProductsCategory productsCategory;
  Discount discount;
  Manufacture manufacture;
  String shortDescriptions;
  String description;
  String type;
  double rating;
  List<String> reviews;
  String languageId;
  String uniqueSeoCode;
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
  List<dynamic> productSpecificationsAttribute;
  DateTime createOnUtc;
  List<ProductPicture> productPicture;
  List<dynamic> offers;
  List<dynamic> locals;
  DateTime updateOnUtc;
  String slug;
  int v;
  String productId;
  int quantity;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productsCategory: ProductsCategory.fromJson(json["productsCategory"]),
    discount: Discount.fromJson(json["discount"]),
    manufacture: Manufacture.fromJson(json["manufacture"]),
    shortDescriptions: json["shortDescriptions"],
    description: json["description"],
    type: json["type"],
    rating: json["rating"].toDouble(),
    reviews: List<String>.from(json["reviews"].map((x) => x)),
    languageId: json["languageId"],
    uniqueSeoCode: json["uniqueSeoCode"],
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
    productSpecificationsAttribute: List<dynamic>.from(json["productSpecificationsAttribute"].map((x) => x)),
    createOnUtc: DateTime.parse(json["createOnUtc"]),
    productPicture: List<ProductPicture>.from(json["productPicture"].map((x) => ProductPicture.fromJson(x))),
    offers: List<dynamic>.from(json["offers"].map((x) => x)),
    locals: List<dynamic>.from(json["Locals"].map((x) => x)),
    updateOnUtc: DateTime.parse(json["updateOnUtc"]),
    slug: json["slug"],
    v: json["__v"],
    productId: json["id"],
    quantity: json["quantity"],
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
    "uniqueSeoCode": uniqueSeoCode,
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
    "productSpecificationsAttribute": List<dynamic>.from(productSpecificationsAttribute.map((x) => x)),
    "createOnUtc": createOnUtc.toIso8601String(),
    "productPicture": List<dynamic>.from(productPicture.map((x) => x.toJson())),
    "offers": List<dynamic>.from(offers.map((x) => x)),
    "Locals": List<dynamic>.from(locals.map((x) => x)),
    "updateOnUtc": updateOnUtc.toIso8601String(),
    "slug": slug,
    "__v": v,
    "id": productId,
    "quantity": quantity,
  };
}

class Discount {
  Discount({
    this.discountId,
    this.name,
    this.productId,
  });

  dynamic discountId;
  String name;
  dynamic productId;

  factory Discount.fromJson(Map<String, dynamic> json) => Discount(
    discountId: json["discountId"],
    name: json["name"],
    productId: json["productId"],
  );

  Map<String, dynamic> toJson() => {
    "discountId": discountId,
    "name": name,
    "productId": productId,
  };
}

class Manufacture {
  Manufacture({
    this.manufactureId,
    this.name,
  });

  String manufactureId;
  String name;

  factory Manufacture.fromJson(Map<String, dynamic> json) => Manufacture(
    manufactureId: json["manufactureId"] == null ? null : json["manufactureId"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "manufactureId": manufactureId == null ? null : manufactureId,
    "name": name == null ? null : name,
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

  Currency currency;
  int oldPrice;
  int productCost;
  String id;
  int priceNow;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    currency: Currency.fromJson(json["currency"]),
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

class Currency {
  Currency({
    this.currencyId,
    this.code,
    this.name,
  });

  String currencyId;
  String code;
  String name;

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
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

class ProductPicture {
  ProductPicture({
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

  factory ProductPicture.fromJson(Map<String, dynamic> json) => ProductPicture(
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

class ProductsCategory {
  ProductsCategory({
    this.productId,
    this.categoryId,
    this.isFeaturedProduct,
    this.displayOrder,
  });

  String productId;
  Parent categoryId;
  bool isFeaturedProduct;
  int displayOrder;

  factory ProductsCategory.fromJson(Map<String, dynamic> json) => ProductsCategory(
    productId: json["productId"],
    categoryId: parentValues.map[json["categoryId"]],
    isFeaturedProduct: json["isFeaturedProduct"],
    displayOrder: json["displayOrder"],
  );

  Map<String, dynamic> toJson() => {
    "productId": productId,
    "categoryId": parentValues.reverse[categoryId],
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

class RatingListCount {
  RatingListCount({
    this.r5,
    this.r4,
    this.r3,
    this.r2,
    this.r1,
  });

  int r5;
  int r4;
  int r3;
  int r2;
  int r1;

  factory RatingListCount.fromJson(Map<String, dynamic> json) => RatingListCount(
    r5: json["R5"],
    r4: json["R4"],
    r3: json["R3"],
    r2: json["R2"],
    r1: json["R1"],
  );

  Map<String, dynamic> toJson() => {
    "R5": r5,
    "R4": r4,
    "R3": r3,
    "R2": r2,
    "R1": r1,
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
