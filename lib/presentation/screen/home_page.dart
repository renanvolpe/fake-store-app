import 'dart:math';

import 'package:fake_store_joao/core/default/empty_or_error_state_default.dart';
import 'package:fake_store_joao/data/repositories/products_repository.dart';
import 'package:fake_store_joao/logic/bloc/get_all_products/get_all_products_bloc.dart';
import 'package:fake_store_joao/presentation/commum_widgets/home_page_shimmer.dart';
import 'package:fake_store_joao/presentation/commum_widgets/promotion_section.dart';
import 'package:fake_store_joao/presentation/commum_widgets/recent_highlight_section.dart';
import 'package:fake_store_joao/presentation/commum_widgets/resumed_sizedbox.dart';
import 'package:fake_store_joao/presentation/commum_widgets/scafold_with_drawer.dart';
import 'package:fake_store_joao/presentation/commum_widgets/select_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                    const SelectCategories(),
                    20.sizeH,
                    PromotionSection(categoryIndex: categoryIndex, listProducts: listProducts),
                    5.sizeH,
                    if (listProducts.length >= 9)
                      RecentHighlightsSection(categoryIndex: categoryIndex, listProducts: listProducts),
                    25.sizeH
                  ],
                ),
              );
            }
            if (state is GetAllProductsFailure) {
              return const EmptyOrErrorStateDefault();
            }
            return const HomePageShimmer();
          },
        ),
      ),
    );
  }
}
