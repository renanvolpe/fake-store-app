import 'package:fake_store_joao/core/themes/colors_app.dart';
import 'package:fake_store_joao/core/themes/style.dart';
import 'package:fake_store_joao/presentation/commum_widgets/resumed_sizedbox.dart';
import 'package:flutter/material.dart';

AppBar AppbarDefault(BuildContext context, String text) {
  return AppBar(
    foregroundColor: ColorsApp.kWhite,
    backgroundColor: Colors.transparent,
    centerTitle: true,
    leading: IconButton(
      onPressed: () => Navigator.pop(context),
      icon: Icon(
        Icons.chevron_left,
        color: ColorsApp.kBlack,
      ),
    ),
    title: Text(
      text,
      style: Style.defaultTextStyle.copyWith(fontSize: 22),
    ),
    actions: [
      Icon(
        Icons.menu,
        color: ColorsApp.kWhite,
      ),
      15.sizeW
    ],
  );
}

AppBar AppbarDefaultJustBackBtn(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent, // Set AppBar background color to transparent
    elevation: 0, // Remove AppBar elevation
    leading: IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
    ),
  );
}
