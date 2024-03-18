import 'package:fake_store_joao/core/themes/colors_app.dart';
import 'package:fake_store_joao/core/themes/style.dart';
import 'package:flutter/material.dart';

class ChoseSize extends StatefulWidget {
  const ChoseSize({
    super.key,
  });

  @override
  State<ChoseSize> createState() => _ChoseSizeState();
}

class _ChoseSizeState extends State<ChoseSize> {
  int sizeChosen = 0;
  final List<String> listSizes = ["P", "M", "G"];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < 3; i++)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: InkWell(
              onTap: () {
                setState(() {
                  sizeChosen = i;
                });
              },
              child: sizeChosen == i
                  ? Ink(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                      color: ColorsApp.kPrimary,
                      child: Text(
                        listSizes[i],
                        style: Style.defaultLightTextStyle.copyWith(fontSize: 18),
                      ),
                    )
                  : Ink(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                      color: ColorsApp.kWhite,
                      child: Text(
                        listSizes[i],
                        style: Style.defaultLightTextStyle.copyWith(fontSize: 18, color: ColorsApp.kPrimary),
                      ),
                    ),
            ),
          ),
      ],
    );
  }
}
