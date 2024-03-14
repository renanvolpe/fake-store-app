import 'package:fake_store_joao/core/themes/style.dart';
import 'package:fake_store_joao/presentation/commum_widgets/resumed_sizedbox.dart';
import 'package:flutter/material.dart';

class EmptyOrErrorStateDefault extends StatelessWidget {
  const EmptyOrErrorStateDefault({
    super.key,  this.text,
  });
 final String? text;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
              padding: const EdgeInsets.all(5),
              color: Colors.black,
              child: const Icon(Icons.smart_toy_sharp, size: 200, color: Colors.white)),
        ),
        20.sizeH,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            15.sizeW,
            Expanded(
              child: Text(
                text ?? "Desculpe, Não há dados a serem mostradas :(",
                textAlign: TextAlign.center,
                style: Style.defaultLightTextStyle.copyWith(fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ),
            15.sizeW,
          ],
        ),
      ],
    ));
  }
}
