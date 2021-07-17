// To parse this JSON data, do
//
//     final viewCart = viewCartFromJson(jsonString);

import 'dart:convert';

ViewCart viewCartFromJson(String str) => ViewCart.fromJson(json.decode(str));

String viewCartToJson(ViewCart data) => json.encode(data.toJson());

class ViewCart {
  ViewCart({
    this.status,
    this.message,
    this.data,
  });

  bool status;
  String message;
  Data data;

  factory ViewCart.fromJson(Map<String, dynamic> json) => ViewCart(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.userId,
    this.orderDate,
    this.orderStatus,
    this.paymentMethod,
    this.orderType,
    this.createdAt,
    this.updatedAt,
    this.products,
  });

  int id;
  String userId;
  String orderDate;
  String orderStatus;
  dynamic paymentMethod;
  String orderType;
  DateTime createdAt;
  DateTime updatedAt;
  List<Product> products;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userId: json["user_id"],
        orderDate: json["order_date"],
        orderStatus: json["order_status"],
        paymentMethod: json["payment_method"],
        orderType: json["order_type"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "order_date": orderDate,
        "order_status": orderStatus,
        "payment_method": paymentMethod,
        "order_type": orderType,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  Product({
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
    this.productGalleries,
    this.category,
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
  List<ProductGallery> productGalleries;
  Category category;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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
        productGalleries: List<ProductGallery>.from(
            json["product_galleries"].map((x) => ProductGallery.fromJson(x))),
        category: Category.fromJson(json["category"]),
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
        "product_galleries":
            List<dynamic>.from(productGalleries.map((x) => x.toJson())),
        "category": category.toJson(),
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
    this.orderId,
    this.productId,
    this.qty,
    this.createdAt,
    this.updatedAt,
  });

  String orderId;
  String productId;
  String qty;
  DateTime createdAt;
  DateTime updatedAt;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        orderId: json["order_id"],
        productId: json["product_id"],
        qty: json["qty"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "product_id": productId,
        "qty": qty,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
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
