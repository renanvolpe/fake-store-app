// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CategoryCreate {
  String name;
  String image;
  CategoryCreate({
    required this.name,
    required this.image,
  });

  CategoryCreate copyWith({
    String? name,
    String? image,
  }) {
    return CategoryCreate(
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
    };
  }

  factory CategoryCreate.fromMap(Map<String, dynamic> map) {
    return CategoryCreate(
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryCreate.fromJson(String source) => CategoryCreate.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CategoryCreate(name: $name, image: $image)';

  @override
  bool operator ==(covariant CategoryCreate other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.image == image;
  }

  @override
  int get hashCode => name.hashCode ^ image.hashCode;
}
