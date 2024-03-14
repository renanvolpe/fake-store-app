
import 'package:fake_store_joao/data/models/abstract_textformfield.dart';
import 'package:flutter/services.dart';

class Name implements IValueObject {
  String _value;
  Name(
    this._value,
  );

  @override
  List<TextInputFormatter>? getMasks() => [];

  @override
  String get hintText => "Nome";

  @override
  void setValue(String newValue) => _value = newValue;

  @override
  String? validator([Object? obj]) {
    if (_value.length < 2) {
      return "Insira um nome com mais caracteres";
    }
    return null;
  }

  @override
  String? get value => _value;
}
