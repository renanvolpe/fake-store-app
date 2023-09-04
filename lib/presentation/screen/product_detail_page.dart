import 'package:fake_store_joao/core/themes/colors_app.dart';
import 'package:fake_store_joao/core/themes/style.dart';
import 'package:fake_store_joao/presentation/commum_widgets/chose_size.dart';
import 'package:fake_store_joao/presentation/commum_widgets/flushbar_function_not_implemented.dart';
import 'package:fake_store_joao/presentation/commum_widgets/resumed_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key, required this.idProd});
  final int idProd;
  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.kWhiteColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(
            Icons.arrow_back,
            color: ColorsApp.kWhiteColor,
          ),
        ),
        backgroundColor: ColorsApp.kBackgroundColor,
        centerTitle: true,
        title: Text(
          "Nome do produto",
          style: Style.defaultLightTextStyle.copyWith(fontSize: 22),
        ),
      ),
      body: LayoutBuilder(
        builder: (_, constraints) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight * 0.45,
              color: ColorsApp.kBlackColor,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.sizeH,
                    Text(
                      "Nome do produto",
                      style: Style.defaultTextStyle.copyWith(fontSize: 22),
                    ),
                    15.sizeH,
                    Text(
                      "R\$ 60,00",
                      style: Style.priceProductTextStyle.copyWith(fontSize: 20),
                    ),
                    15.sizeH,
                    Text(
                      "Descrição: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                      style: Style.defaultTextStyle.copyWith(fontSize: 14),
                    ),
                    15.sizeH,
                    Text("Características: Muito Conforto, DryFit, Esportiva",
                        style: Style.defaultTextStyle.copyWith(fontSize: 14)),
                    15.sizeH,
                    Text(
                      "Tamanho: ",
                      style: Style.defaultTextStyle.copyWith(fontSize: 14),
                    ),
                    15.sizeH,
                    const ChoseSize(),
                    const Spacer(),
                    Row(
                      children: [
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            flushbarNotImplementedYet(context);
                          },
                          child: Ink(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 12),
                            color: Colors.lightBlue,
                            child: Center(
                                child: Text(
                              "Comprar",
                              style: Style.defaultLightTextStyle
                                  .copyWith(fontSize: 22),
                            )),
                          ),
                        ))
                      ],
                    ),
                    10.sizeH,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
