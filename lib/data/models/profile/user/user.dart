// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:fake_store_joao/data/models/profile/user/email.dart';
import 'package:fake_store_joao/data/models/profile/user/name.dart';
import 'package:fake_store_joao/data/models/profile/user/password.dart';

class User {
  Name name;
  Email email;
  Password password;
  String avatar;
  String role;
  int id;
  String creationAt;
  String updatedAt;
  User({
    required this.name,
    required this.email,
    required this.password,
    required this.avatar,
    required this.role,
    required this.id,
    required this.creationAt,
    required this.updatedAt,
  });



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'avatar': avatar,
      'role': role,
      'id': id,
      'creationAt': creationAt,
      'updatedAt': updatedAt,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: Name(map['name'] as String),
      email: Email(map['email'] as String),
      password: Password(map['password'] as String),
      avatar: map['avatar'] as String,
      role: map['role'] as String,
      id: map['id'] as int,
      creationAt: map['creationAt'] as String,
      updatedAt: map['updatedAt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(name: $name, email: $email, password: $password, avatar: $avatar, role: $role, id: $id, creationAt: $creationAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.email == email &&
      other.password == password &&
      other.avatar == avatar &&
      other.role == role &&
      other.id == id &&
      other.creationAt == creationAt &&
      other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      email.hashCode ^
      password.hashCode ^
      avatar.hashCode ^
      role.hashCode ^
      id.hashCode ^
      creationAt.hashCode ^
      updatedAt.hashCode;
  }
}
