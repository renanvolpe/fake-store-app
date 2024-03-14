import 'package:fake_store_joao/data/models/abstract_textformfield.dart';
import 'package:flutter/services.dart';

class Password implements IValueObject {
  String _value;
  Password(
    this._value,
  );

  @override
  List<TextInputFormatter>? getMasks() => [];

  @override
  String get hintText => "Passoword";

  @override
  void setValue(String newValue) => _value = newValue;

  @override
  String? validator([Object? obj]) {
    if (_value.length < 4) {
      return "Insira uma senha com mais caracteres";
    }
    return null;
  }

  @override
  String? get value => _value;
}
