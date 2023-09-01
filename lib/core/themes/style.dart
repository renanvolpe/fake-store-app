import 'package:fake_store_joao/core/themes/colors_app.dart';
import 'package:flutter/material.dart';

class Style {
  static TextStyle get textStyle {
    return const TextStyle(); // TODO put the font here
  }

  static TextStyle defaultTextStyle = textStyle.copyWith(
    color: ColorsApp.kBlackColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static TextStyle defaultLightTextStyle = textStyle.copyWith(
    color: ColorsApp.kWhiteColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
}
