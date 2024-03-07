import 'dart:math';

import 'package:fake_store_joao/core/themes/colors_app.dart';
import 'package:fake_store_joao/core/themes/style.dart';
import 'package:fake_store_joao/data/repositories/products_repository.dart';
import 'package:fake_store_joao/logic/bloc/get_all_products/get_all_products_bloc.dart';
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
    getAllProductsController.add(GetAllProductsStarted(categoryIndex));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithDrawe(
      title: "Home",
      body: BlocBuilder<GetAllProductsBloc, GetAllProductsState>(
        bloc: getAllProductsController,
        builder: (context, state) {
          if (state is GetAllProductsSuccess) {
            // var listProducts = state.listProducts;
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
                  Text(
                    "Promoções",
                    style: Style.defaultLightTextStyle.copyWith(fontSize: 24),
                  ),
                  15.sizeH,
                  /*StaggeredGrid.count(
                    crossAxisCount: 4,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    children: [
                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2,
                        child: InkWell(
                          onTap: () => context.push(
                              "/home/categories/$categoryIndex/products/${listProducts[0].id}"),
                          child: Container(
                              color: Colors.amber,
                              margin: const EdgeInsets.all(1),
                              child: Image.network(listProducts[0].images.first,
                                  fit: BoxFit.fill)),
                        ),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 1,
                        child: InkWell(
                          onTap: () => context.push(
                              "/home/categories/$categoryIndex/products/${listProducts[1].id}"),
                          child: Container(
                              color: Colors.amber,
                              margin: const EdgeInsets.all(1),
                              child: Image.network(listProducts[1].images.first,
                                  fit: BoxFit.fill)),
                        ),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 1,
                        child: InkWell(
                          onTap: () => context.push(
                              "/home/categories/$categoryIndex/products/${listProducts[2].id}"),
                          child: Container(
                              color: Colors.amber,
                              margin: const EdgeInsets.all(1),
                              child: Image.network(listProducts[2].images.first,
                                  fit: BoxFit.fill)),
                        ),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 1,
                        child: InkWell(
                          onTap: () => context.push(
                              "/home/categories/$categoryIndex/products/${listProducts[3].id}"),
                          child: Container(
                              color: Colors.amber,
                              margin: const EdgeInsets.all(1),
                              child: Image.network(listProducts[3].images.first,
                                  fit: BoxFit.fill)),
                        ),
                      ),
                    ],
                  ),
                  15.sizeH,

                  //TODO CALL THE CATEGORIES HERE
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      "Destaques recentes",
                      style: Style.defaultLightTextStyle.copyWith(fontSize: 24),
                    ),
                  ),
                  StaggeredGrid.count(
                    crossAxisCount: 4,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    children: [
                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2,
                        child: InkWell(
                          onTap: () => context.push(
                              "/home/categories/$categoryIndex/products/${listProducts[5].id}"),
                          child: Container(
                              color: Colors.amber,
                              margin: const EdgeInsets.all(1),
                              child: Image.network(listProducts[5].images.first,
                                  fit: BoxFit.fill)),
                        ),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 1,
                        child: InkWell(
                          onTap: () => context.push(
                              "/home/categories/$categoryIndex/products/${listProducts[6].id}"),
                          child: Container(
                              color: Colors.amber,
                              margin: const EdgeInsets.all(1),
                              child: Image.network(listProducts[6].images.first,
                                  fit: BoxFit.fill)),
                        ),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 1,
                        child: InkWell(
                          onTap: () => context.push(
                              "/home/categories/$categoryIndex/products/${listProducts[7].id}"),
                          child: Container(
                              color: Colors.amber,
                              margin: const EdgeInsets.all(1),
                              child: Image.network(listProducts[7].images.first,
                                  fit: BoxFit.fill)),
                        ),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 1,
                        child: InkWell(
                          onTap: () => context.push(
                              "/home/categories/$categoryIndex/products/${listProducts[8].id}"),
                          child: Container(
                              color: Colors.amber,
                              margin: const EdgeInsets.all(1),
                              child: Image.network(listProducts[8].images.first,
                                  fit: BoxFit.fill)),
                        ),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 4,
                        mainAxisCellCount: 2,
                        child: InkWell(
                          onTap: () => context.push(
                              "/home/categories/$categoryIndex/products/${listProducts[9].id}"),
                          child: Container(
                              color: Colors.amber,
                              margin: const EdgeInsets.all(1),
                              child: Image.network(
                                listProducts[9].images.first,
                                fit: BoxFit.fill,
                              )),
                        ),
                      ),
                    ],
                  ),*/
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
    );
  }
}
