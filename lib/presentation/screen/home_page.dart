import 'dart:math';

import 'package:fake_store_joao/core/themes/colors_app.dart';
import 'package:fake_store_joao/core/themes/style.dart';
import 'package:fake_store_joao/data/repositories/products_repository.dart';
import 'package:fake_store_joao/logic/bloc/get_all_products/get_all_products_bloc.dart';
import 'package:fake_store_joao/presentation/commum_widgets/promotion_section.dart';
import 'package:fake_store_joao/presentation/commum_widgets/recent_highlight_section.dart';
import 'package:fake_store_joao/presentation/commum_widgets/resumed_sizedbox.dart';
import 'package:fake_store_joao/presentation/commum_widgets/scafold_with_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late GetAllProductsBloc getAllProductsController;
  Random random = Random();
  late int categoryIndex;

  @override
  void initState() {
    categoryIndex = random.nextInt(5);
    getAllProductsController = GetAllProductsBloc(ProductRepository());
    getAllProductsController.add(GetAllProductsStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithDrawe(
      title: "Home",
      body: RefreshIndicator(
        onRefresh: () async => getAllProductsController.add(GetAllProductsStarted()),
        child: BlocBuilder<GetAllProductsBloc, GetAllProductsState>(
          bloc: getAllProductsController,
          builder: (context, state) {
            if (state is GetAllProductsSuccess) {
              var listProducts = state.listProducts;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    20.sizeH,
                    Row(
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
                    ),
                    20.sizeH,
                    if (listProducts.length < 4) const Text("Não há promoções no momento"),
                    if (listProducts.length >= 4)
                      PromotionSection(categoryIndex: categoryIndex, listProducts: listProducts),
                    5.sizeH,
                    if (listProducts.length >= 9)
                      RecentHighlightsSection(categoryIndex: categoryIndex, listProducts: listProducts),
                    25.sizeH
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
