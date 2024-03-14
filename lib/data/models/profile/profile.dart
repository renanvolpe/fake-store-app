// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:fake_store_joao/data/models/profile/user/user.dart';

class Profile {
  String token;
  User user;
  Profile({
    required this.token,
    required this.user,
  });

  setNewProfile(Profile newProf) {
    token = newProf.token;
    user = newProf.user;
  }

  Profile copyWith({
    String? token,
    User? user,
  }) {
    return Profile(
      token: token ?? this.token,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'user': user.toMap(),
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      token: map['token'] as String,
      user: User.fromMap(map['user'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) => Profile.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Profile(token: $token, user: $user)';

  @override
  bool operator ==(covariant Profile other) {
    if (identical(this, other)) return true;

    return other.token == token && other.user == user;
  }

  @override
  int get hashCode => token.hashCode ^ user.hashCode;
}
