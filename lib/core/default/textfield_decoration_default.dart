import 'package:fake_store_joao/core/themes/colors_app.dart';
import 'package:fake_store_joao/core/themes/style.dart';
import 'package:flutter/material.dart';

InputDecoration textfieldDecorationDefault(
    {String? hintText = "",
    String? iconPath,
    IconData? endIcon,
    void Function()? iconFuncition,
    IconData? prefixIcon}) {
  return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      filled: true,
      fillColor: Colors.white,
      hintText: hintText,
      hintStyle: Style.hintTextStyle,
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Color(0xFFBCC4D6)), borderRadius: BorderRadius.circular(8)),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Color(0xFFBCC4D6)), borderRadius: BorderRadius.circular(8)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      labelStyle: const TextStyle(
        color: Color(0x0ff00000),
        fontSize: 18.5,
        fontWeight: FontWeight.w400,
      ),
      prefixIcon: Icon(prefixIcon, color: ColorsApp.kGrey));
}
