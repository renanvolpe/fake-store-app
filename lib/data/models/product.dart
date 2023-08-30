// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'category.dart';

class Product {
  int id;
  String title;
  int price;
  String description;
  String creationAt;
  String updatedAt;
  Category category;
  List<String> images;
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.creationAt,
    required this.updatedAt,
    required this.category,
    required this.images,
  });

  Product copyWith({
    int? id,
    String? title,
    int? price,
    String? description,
    String? creationAt,
    String? updatedAt,
    Category? category,
    List<String>? images,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      creationAt: creationAt ?? this.creationAt,
      updatedAt: updatedAt ?? this.updatedAt,
      category: category ?? this.category,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'creationAt': creationAt,
      'updatedAt': updatedAt,
      'category': category.toMap(),
      'images': images,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      title: map['title'] as String,
      price: map['price'] as int,
      description: map['description'] as String,
      creationAt: map['creationAt'] as String,
      updatedAt: map['updatedAt'] as String,
      category: Category.fromMap(map['category'] as Map<String, dynamic>),
      images: List<String>.from((map['images'] )),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(id: $id, title: $title, price: $price, description: $description, creationAt: $creationAt, updatedAt: $updatedAt, category: $category, images: $images)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.price == price &&
        other.description == description &&
        other.creationAt == creationAt &&
        other.updatedAt == updatedAt &&
        other.category == category;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        price.hashCode ^
        description.hashCode ^
        creationAt.hashCode ^
        updatedAt.hashCode ^
        category.hashCode ^
        images.hashCode;
  }
}
