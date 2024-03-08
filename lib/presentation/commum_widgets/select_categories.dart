import 'package:fake_store_joao/core/themes/colors_app.dart';
import 'package:fake_store_joao/core/themes/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SelectCategories extends StatelessWidget {
  const SelectCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: InkWell(
            onTap: () => context.push("/home/categories"),
            child: Ink(
              color: ColorsApp.kWhiteColor,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: Text(
                    "Seleciona por categorias aqui",
                    style: Style.defaultTextStyle.copyWith(fontSize: 24),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
