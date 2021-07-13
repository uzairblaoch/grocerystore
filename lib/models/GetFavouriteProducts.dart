// To parse this JSON data, do
//
//     final getFavouriteProducts = getFavouriteProductsFromJson(jsonString);

import 'dart:convert';

GetFavouriteProducts getFavouriteProductsFromJson(String str) =>
    GetFavouriteProducts.fromJson(json.decode(str));

String getFavouriteProductsToJson(GetFavouriteProducts data) =>
    json.encode(data.toJson());

class GetFavouriteProducts {
  GetFavouriteProducts({
    this.status,
    this.data,
  });

  bool status;
  List<Datum> data;

  factory GetFavouriteProducts.fromJson(Map<String, dynamic> json) =>
      GetFavouriteProducts(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.categoryId,
    this.productName,
    this.description,
    this.salePrice,
    this.costPrice,
    this.qty,
    this.isPopular,
    this.createdAt,
    this.updatedAt,
    this.pivot,
    this.category,
    this.productGalleries,
  });

  int id;
  String categoryId;
  String productName;
  String description;
  String salePrice;
  String costPrice;
  String qty;
  String isPopular;
  DateTime createdAt;
  DateTime updatedAt;
  Pivot pivot;
  Category category;
  List<ProductGallery> productGalleries;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        categoryId: json["category_id"],
        productName: json["product_name"],
        description: json["description"],
        salePrice: json["sale_price"],
        costPrice: json["cost_price"],
        qty: json["qty"],
        isPopular: json["is_popular"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pivot: Pivot.fromJson(json["pivot"]),
        category: Category.fromJson(json["category"]),
        productGalleries: List<ProductGallery>.from(
            json["product_galleries"].map((x) => ProductGallery.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "product_name": productName,
        "description": description,
        "sale_price": salePrice,
        "cost_price": costPrice,
        "qty": qty,
        "is_popular": isPopular,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "pivot": pivot.toJson(),
        "category": category.toJson(),
        "product_galleries":
            List<dynamic>.from(productGalleries.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    this.id,
    this.categoryName,
    this.icon,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String categoryName;
  String icon;
  DateTime createdAt;
  DateTime updatedAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        categoryName: json["category_name"],
        icon: json["icon"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
        "icon": icon,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Pivot {
  Pivot({
    this.userId,
    this.productId,
  });

  String userId;
  String productId;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        userId: json["user_id"],
        productId: json["product_id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "product_id": productId,
      };
}

class ProductGallery {
  ProductGallery({
    this.id,
    this.productId,
    this.productImage,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String productId;
  String productImage;
  DateTime createdAt;
  DateTime updatedAt;

  factory ProductGallery.fromJson(Map<String, dynamic> json) => ProductGallery(
        id: json["id"],
        productId: json["product_id"],
        productImage: json["product_image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "product_image": productImage,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
