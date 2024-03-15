import 'package:fake_store_joao/core/themes/colors_app.dart';
import 'package:fake_store_joao/core/themes/style.dart';
import 'package:flutter/material.dart';

class ButtonBorderPrimary extends StatelessWidget {
  const ButtonBorderPrimary({
    Key? key,
    this.text,
    this.child,
    this.paddingV,
    this.paddingH,
    this.radius = 10,
    this.onTap,
  }) : super(key: key);

  final String? text;
  final Widget? child;
  final double? paddingV;
  final double? paddingH;
  final double radius;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(radius),
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(radius),
        splashColor: Colors.white,
        onTap: onTap,
        child: Ink(
          padding: EdgeInsets.symmetric(vertical: paddingV ?? 12, horizontal: paddingH ?? 10),
          decoration: BoxDecoration(
            color: ColorsApp.kPrimary, // Set your desired background color here
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Center(
            child: text != null
                ? Text(
                    text!,
                    style: Style.defaultLightTextStyle.copyWith(fontSize: 18),
                    textAlign: TextAlign.center,
                  )
                : child,
          ),
        ),
      ),
    );
  }
}

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({this.text, this.child, this.paddingV, this.paddingH, this.radius = 10, this.onTap, super.key});
  final String? text;
  final Widget? child;
  final double? paddingV;
  final double? paddingH;
  final double radius;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(radius),
      onTap: onTap,
      child: Ink(
          padding: EdgeInsets.symmetric(vertical: paddingV ?? 12, horizontal: paddingH ?? 10),
          decoration: BoxDecoration(
              color: ColorsApp.kWhite,
              border: Border.all(width: 1, color: ColorsApp.kGrey),
              borderRadius: BorderRadius.circular(radius)),
          child: text != null
              ? Text(text!,
                  style: Style.defaultTextStyle
                      .copyWith(fontWeight: FontWeight.w500, fontSize: 18, color: ColorsApp.kPrimary),
                  textAlign: TextAlign.center)
              : child),
    );
  }
}
