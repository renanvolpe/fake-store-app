// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserCreate {
  String name;
  String email;
  String password;
  String avatar;
  String role;
  UserCreate({
    required this.name,
    required this.email,
    required this.password,
    required this.avatar,
    required this.role,
  });

  UserCreate copyWith({
    String? name,
    String? email,
    String? password,
    String? avatar,
    String? role,
  }) {
    return UserCreate(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      avatar: avatar ?? this.avatar,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'avatar': avatar,
      'role': role,
    };
  }

  factory UserCreate.fromMap(Map<String, dynamic> map) {
    return UserCreate(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      avatar: map['avatar'] as String,
      role: map['role'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserCreate.fromJson(String source) => UserCreate.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserCreate(name: $name, email: $email, password: $password, avatar: $avatar, role: $role)';
  }

  @override
  bool operator ==(covariant UserCreate other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.email == email &&
      other.password == password &&
      other.avatar == avatar &&
      other.role == role;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      email.hashCode ^
      password.hashCode ^
      avatar.hashCode ^
      role.hashCode;
  }
}
