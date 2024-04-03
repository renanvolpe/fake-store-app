// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class ProductCreate {
  String title;
  int price;
  String description;
  int categodyId;
  List<String> images;
  ProductCreate({
    required this.title,
    required this.price,
    required this.description,
    required this.categodyId,
    required this.images,
  });

  factory ProductCreate.toTest(int idCategory) =>  ProductCreate(title: "new Product", price: 100, description: "description here", categodyId: idCategory, images: [
        "https://assets-global.website-files.com/5f2a93fe880654a977c51043/620fd215f344f16633f1aafc_hero_2.jpeg"
      ]);

  ProductCreate copyWith({
    String? title,
    int? price,
    String? description,
    int? categodyId,
    List<String>? images,
  }) {
    return ProductCreate(
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      categodyId: categodyId ?? this.categodyId,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'price': price,
      'description': description,
      'categodyId': categodyId,
      'images': images,
    };
  }

  factory ProductCreate.fromMap(Map<String, dynamic> map) {
    return ProductCreate(
      title: map['title'] as String,
      price: map['price'] as int,
      description: map['description'] as String,
      categodyId: map['categodyId'] as int,
      images: List<String>.from((map['images'] as List<String>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductCreate.fromJson(String source) => ProductCreate.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductCreate(title: $title, price: $price, description: $description, categodyId: $categodyId, images: $images)';
  }

  @override
  bool operator ==(covariant ProductCreate other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.price == price &&
      other.description == description &&
      other.categodyId == categodyId &&
      listEquals(other.images, images);
  }

  @override
  int get hashCode {
    return title.hashCode ^
      price.hashCode ^
      description.hashCode ^
      categodyId.hashCode ^
      images.hashCode;
  }
}

