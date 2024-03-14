import 'package:flutter/material.dart';

InputDecoration textfieldDecorationDefault(
    {String? hintText = "", String? iconPath, IconData? endIcon, void Function()? iconFuncition}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
    filled: true,
    fillColor: Colors.white,
    hintText: hintText,
    enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: Color(0xFFBCC4D6)), borderRadius: BorderRadius.circular(8)),
    focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 2, color: Color(0xFFBCC4D6)), borderRadius: BorderRadius.circular(8)),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    labelStyle: const TextStyle(
      color: Color(0xFF8893AC),
      fontSize: 18.5,
      fontWeight: FontWeight.w400,
    ),
  );
}