// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/src/services/text_formatter.dart';

import 'package:fake_store_joao/data/models/abstract_textformfield.dart';

class Email implements IValueObject {
  String _value;
  Email(
    this._value,
  );

  @override
  List<TextInputFormatter>? getMasks() => [];

  @override
  String get hintText => "E-mail";

  @override
  void setValue(String newValue) => _value = newValue;

  @override
  String? validator([Object? obj]) {
    if (!_value.contains("@")) {
      return "Insira um e=mail válido";
    }
    return null;
  }

  @override
  String? get value => _value;
}
