import 'package:fake_store_joao/core/themes/colors_app.dart';
import 'package:fake_store_joao/core/themes/style.dart';
import 'package:flutter/material.dart';

class ButtonBorderPrimary extends StatelessWidget {
  const ButtonBorderPrimary({this.text, this.child, this.paddingV, this.paddingH, super.key});
  final String? text;
  final Widget? child;
  final double? paddingV;
  final double? paddingH;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: paddingV ?? 12, horizontal: paddingH ?? 10),
        decoration: BoxDecoration(
            color: ColorsApp.kWhiteColor,
            border: Border.all(width: 1, color: Colors.lightBlue),
            borderRadius: BorderRadius.circular(10)),
        child: text != null
            ? Text(text!,
                style: Style.defaultTextStyle.copyWith(fontWeight: FontWeight.w500), textAlign: TextAlign.center)
            : child);
  }
}
