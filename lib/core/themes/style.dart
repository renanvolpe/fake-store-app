import 'package:fake_store_joao/core/themes/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Style {
  static TextStyle get textStyle {
    return GoogleFonts.dmSans();
  }

  static TextStyle defaultTextStyle = textStyle.copyWith(
    color: ColorsApp.kBlack,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static TextStyle defaultLightTextStyle = textStyle.copyWith(
    color: ColorsApp.kWhite,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static TextStyle priceProductTextStyle = textStyle.copyWith(
    color: ColorsApp.kBackground,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static TextStyle hintTextStyle = textStyle.copyWith(
    color: ColorsApp.kGrey,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
}
