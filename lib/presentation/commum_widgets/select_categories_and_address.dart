import 'package:fake_store_joao/core/default/button_default.dart';
import 'package:fake_store_joao/core/themes/style.dart';
import 'package:fake_store_joao/presentation/commum_widgets/resumed_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SelectCategoriesAndAddress extends StatelessWidget {
  const SelectCategoriesAndAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        10.sizeW,
        Expanded(
          child: InkWell(
            onTap: () => context.push("/home/address"),
            child: Ink(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: ButtonBorderPrimary(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.pin_drop, color: Colors.lightBlue),
                        5.sizeW,
                        Text(
                          "Endereços",
                          style: Style.defaultTextStyle.copyWith(fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        30.sizeW,
        Expanded(
          child: InkWell(
            onTap: () => context.push("/home/categories"),
            child: Ink(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: ButtonBorderPrimary(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.shopping_cart, color: Colors.lightBlue),
                        5.sizeW,
                        Text(
                          "Categorias",
                          style: Style.defaultTextStyle.copyWith(fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        10.sizeW,
      ],
    );
  }
}
