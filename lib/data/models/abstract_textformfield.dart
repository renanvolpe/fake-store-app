import 'package:flutter/services.dart';

abstract class IValueObject {
  String? validator([Object? obj]);
  void setValue(String newValue);
  String get hintText;
  String? get value;
  List<TextInputFormatter>? getMasks();
}
