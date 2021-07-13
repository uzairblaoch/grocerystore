// To parse this JSON data, do
//
//     final productsByCategory = productsByCategoryFromJson(jsonString);

import 'dart:convert';

ProductsByCategory productsByCategoryFromJson(String str) =>
    ProductsByCategory.fromJson(json.decode(str));

String productsByCategoryToJson(ProductsByCategory data) =>
    json.encode(data.toJson());

class ProductsByCategory {
  ProductsByCategory({
    this.status,
    this.data,
  });

  bool status;
  List<Datum> data;

  factory ProductsByCategory.fromJson(Map<String, dynamic> json) =>
      ProductsByCategory(
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
  Category category;
  List<dynamic> productGalleries;

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
        category: Category.fromJson(json["category"]),
        productGalleries:
            List<dynamic>.from(json["product_galleries"].map((x) => x)),
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
        "category": category.toJson(),
        "product_galleries": List<dynamic>.from(productGalleries.map((x) => x)),
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
