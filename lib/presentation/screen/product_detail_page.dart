import 'package:fake_store_joao/core/default/appbar_default.dart';
import 'package:fake_store_joao/core/default/image_default.dart';
import 'package:fake_store_joao/core/default/loading_shimmer.dart';
import 'package:fake_store_joao/core/themes/colors_app.dart';
import 'package:fake_store_joao/core/themes/style.dart';
import 'package:fake_store_joao/data/models/product.dart';
import 'package:fake_store_joao/data/repositories/products_repository.dart';
import 'package:fake_store_joao/logic/bloc/get_product/get_product_bloc.dart';
import 'package:fake_store_joao/presentation/commum_widgets/chose_size.dart';
import 'package:fake_store_joao/presentation/commum_widgets/flushbar_function_not_implemented.dart';
import 'package:fake_store_joao/presentation/commum_widgets/resumed_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key, required this.idProd});
  final int idProd;
  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late GetProductBloc getProductController;
  @override
  void initState() {
    getProductController = GetProductBloc(ProductRepository());
    getProductController.add(GetProductStarted(widget.idProd));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: ColorsApp.kWhiteColor,
      appBar: AppbarDefaultJustBackBtn(context),
      body: LayoutBuilder(
        builder: (_, constraints) => BlocBuilder<GetProductBloc, GetProductState>(
          bloc: getProductController,
          builder: (context, state) {
            if (state is GetProductSuccess) {
              Product product = state.product;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight * 0.40,
                    child: ImageDefault(
                      radius: 0,
                      url: product.images.first,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          10.sizeH,
                          Text(
                            product.title,
                            style: Style.defaultTextStyle.copyWith(fontSize: 22),
                          ),
                          15.sizeH,
                          Text(
                            "R\$ ${product.price}",
                            style: Style.priceProductTextStyle.copyWith(fontSize: 20),
                          ),
                          15.sizeH,
                          Text(
                            "Descrição: ${product.description}",
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
                                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                                  color: Colors.lightBlue,
                                  child: Center(
                                      child: Text(
                                    "Comprar",
                                    style: Style.defaultLightTextStyle.copyWith(fontSize: 22),
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
              );
            }
            return const ProductPageShimmer();
          },
        ),
      ),
    );
  }
}

class ProductPageShimmer extends StatelessWidget {
  const ProductPageShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoadingShimmerDefault(height: MediaQuery.sizeOf(context).height * 0.40),
            15.sizeH,
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LoadingShimmerDefault(
                    height: 20,
                  ),
                  15.sizeH,
                  const LoadingShimmerDefault(height: 20, width: 100),
                  15.sizeH,
                  const LoadingShimmerDefault(height: 50),
                  15.sizeH,
                  const LoadingShimmerDefault(height: 80, width: 150),
                  150.sizeH,
                  const LoadingShimmerDefault(height: 50),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
