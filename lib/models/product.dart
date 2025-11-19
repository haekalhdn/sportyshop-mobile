import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    int id;
    String name;
    int price;
    String description;
    String thumbnail;
    String category;
    String categoryDisplay;
    bool isFeatured;
    bool isProductHot;
    int stock;
    int productViews;
    DateTime createdAt;
    int? userId;
    String username;

    Product({
        required this.id,
        required this.name,
        required this.price,
        required this.description,
        required this.thumbnail,
        required this.category,
        required this.categoryDisplay,
        required this.isFeatured,
        required this.isProductHot,
        required this.stock,
        required this.productViews,
        required this.createdAt,
        required this.userId,
        required this.username,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        thumbnail: json["thumbnail"],
        category: json["category"],
        categoryDisplay: json["category_display"],
        isFeatured: json["is_featured"],
        isProductHot: json["is_product_hot"],
        stock: json["stock"],
        productViews: json["product_views"],
        createdAt: DateTime.parse(json["created_at"]),
        userId: json["user_id"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "thumbnail": thumbnail,
        "category": category,
        "category_display": categoryDisplay,
        "is_featured": isFeatured,
        "is_product_hot": isProductHot,
        "stock": stock,
        "product_views": productViews,
        "created_at": createdAt.toIso8601String(),
        "user_id": userId,
        "username": username,
    };
}