import 'package:fake_store_joao/core/themes/colors_app.dart';
import 'package:fake_store_joao/core/themes/style.dart';
import 'package:fake_store_joao/presentation/commum_widgets/resumed_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.kBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: ColorsApp.kWhiteColor,
          ),
        ),
        title: Text(
          "Lista de produtos",
          style: Style.defaultLightTextStyle.copyWith(fontSize: 22),
        ),
        actions: [
          Icon(
            Icons.menu,
            color: ColorsApp.kWhiteColor,
          ),
          15.sizeW
        ],
        backgroundColor: ColorsApp.kBackgroundColor,
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () =>
                              context.push("/categories/products/${3}"),
                          child: Ink(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 150,
                                    width: 120,
                                    color: Colors.black,
                                  ),
                                  15.sizeW,
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Nome do produto",
                                        style: Style.defaultTextStyle
                                            .copyWith(fontSize: 20),
                                      ),
                                      30.sizeH,
                                      Text(
                                        "R\$60,00",
                                        style: Style.priceProductTextStyle
                                            .copyWith(fontSize: 18),
                                      ),
                                      Text(
                                        "6 produtos em estoque",
                                        style: Style.defaultTextStyle
                                            .copyWith(fontSize: 14),
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                  const Icon(Icons.chevron_right)
                                ]),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
