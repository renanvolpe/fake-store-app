// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Address {
  int id;
  String street;
  String district;
  String num;
  String city;
  String state;
  String complement;
  Address({
    required this.id,
    required this.street,
    required this.district,
    required this.num,
    required this.city,
    required this.state,
    required this.complement,
  });

  Address copyWith({
    int? id,
    String? street,
    String? district,
    String? num,
    String? city,
    String? state,
    String? complement,
  }) {
    return Address(
      id: id ?? this.id,
      street: street ?? this.street,
      district: district ?? this.district,
      num: num ?? this.num,
      city: city ?? this.city,
      state: state ?? this.state,
      complement: complement ?? this.complement,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'street': street,
      'district': district,
      'num': num,
      'city': city,
      'state': state,
      'complement': complement,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      id: map['id'] as int,
      street: map['street'] as String,
      district: map['district'] as String,
      num: map['num'] as String,
      city: map['city'] as String,
      state: map['state'] as String,
      complement: map['complement'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) => Address.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Address(id: $id, street: $street, district: $district, num: $num, city: $city, state: $state, complement: $complement)';
  }

  @override
  bool operator ==(covariant Address other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.street == street &&
      other.district == district &&
      other.num == num &&
      other.city == city &&
      other.state == state &&
      other.complement == complement;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      street.hashCode ^
      district.hashCode ^
      num.hashCode ^
      city.hashCode ^
      state.hashCode ^
      complement.hashCode;
  }
}


