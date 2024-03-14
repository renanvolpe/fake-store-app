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
        decoration: BoxDecoration(color: ColorsApp.kPrimary, borderRadius: BorderRadius.circular(10)),
        child: text != null
            ? Text(text!,
                style:
                    Style.defaultTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 18, color: ColorsApp.kWhite),
                textAlign: TextAlign.center)
            : child);
  }
}

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({this.text, this.child, this.paddingV, this.paddingH, super.key});
  final String? text;
  final Widget? child;
  final double? paddingV;
  final double? paddingH;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: paddingV ?? 12, horizontal: paddingH ?? 10),
        decoration: BoxDecoration(color: ColorsApp.kWhite, borderRadius: BorderRadius.circular(10)),
        child: text != null
            ? Text(text!,
                style: Style.defaultTextStyle
                    .copyWith(fontWeight: FontWeight.w500, fontSize: 18, color: ColorsApp.kPrimary),
                textAlign: TextAlign.center)
            : child);
  }
}
