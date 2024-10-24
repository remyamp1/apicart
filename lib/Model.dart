// To parse this JSON data, do
//
//     final modelapi = modelapiFromJson(jsonString);

import 'dart:convert';

List<Modelapi> modelapiFromJson(String str) => List<Modelapi>.from(json.decode(str).map((x) => Modelapi.fromJson(x)));



class Modelapi {
    List<Product> products;
    double total;
    double discountedTotal;
    int userId;
    int totalProducts;
    int totalQuantity;

    Modelapi({
        required this.products,
        required this.total,
        required this.discountedTotal,
        required this.userId,
        required this.totalProducts,
        required this.totalQuantity,
    });

    factory Modelapi.fromJson(Map<String, dynamic> json) => Modelapi(
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
        total: json["total"]?.toDouble(),
        discountedTotal: json["discountedTotal"]?.toDouble(),
        userId: json["userId"],
        totalProducts: json["totalProducts"],
        totalQuantity: json["totalQuantity"],
    );

    
}

class Product {
    int id;
    String title;
    double price;
    int quantity;
    double total;
    double discountPercentage;
    double discountedTotal;
    String thumbnail;

    Product({
        required this.id,
        required this.title,
        required this.price,
        required this.quantity,
        required this.total,
        required this.discountPercentage,
        required this.discountedTotal,
        required this.thumbnail,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        quantity: json["quantity"],
        total: json["total"]?.toDouble(),
        discountPercentage: json["discountPercentage"]?.toDouble(),
        discountedTotal: json["discountedTotal"]?.toDouble(),
        thumbnail: json["thumbnail"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "quantity": quantity,
        "total": total,
        "discountPercentage": discountPercentage,
        "discountedTotal": discountedTotal,
        "thumbnail": thumbnail,
    };
}
