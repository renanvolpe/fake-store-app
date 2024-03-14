import 'package:fake_store_joao/core/themes/colors_app.dart';
import 'package:flutter/material.dart';

class Style {
  static TextStyle get textStyle {
    return const TextStyle(); // TODO put the font here
  }

  static TextStyle defaultTextStyle = textStyle.copyWith(
    color: ColorsApp.kBlack,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static TextStyle defaultLightTextStyle = textStyle.copyWith(
    color: ColorsApp.kWhite,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static TextStyle priceProductTextStyle = textStyle.copyWith(
    color: ColorsApp.kBackground,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static TextStyle hintTextStyle = textStyle.copyWith(
    color: Colors.grey,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
}
