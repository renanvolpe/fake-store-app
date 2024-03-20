import 'package:fake_store_joao/core/default/appbar_default.dart';
import 'package:fake_store_joao/core/default/image_default.dart';
import 'package:fake_store_joao/core/themes/colors_app.dart';
import 'package:fake_store_joao/core/themes/style.dart';
import 'package:fake_store_joao/data/models/product.dart';
import 'package:fake_store_joao/data/repositories/products_repository.dart';
import 'package:fake_store_joao/logic/bloc/get_all_products/get_all_products_bloc.dart';
import 'package:fake_store_joao/presentation/commum_widgets/products_page_shimmer.dart';
import 'package:fake_store_joao/presentation/commum_widgets/resumed_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key, required this.idCategory, this.isEdit = false, this.nameCat});
  final int idCategory;
  final bool isEdit;
  final String? nameCat;
  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  late GetAllProductsBloc getAllProductsController;

  @override
  void initState() {
    getAllProductsController = GetAllProductsBloc(ProductRepository());
    getAllProductsController.add(GetAllProductsStarted(widget.idCategory));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.kBackground,
      appBar: AppbarDefault(context, widget.nameCat ?? "Lista de produtos"),
      body: BlocBuilder<GetAllProductsBloc, GetAllProductsState>(
        bloc: getAllProductsController,
        builder: (context, state) {
          if (state is GetAllProductsSuccess) {
            List<Product> listProducts = state.listProducts;
            return SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      for (int i = 0; i < listProducts.length; i++) _buttonToProductDetail(context, listProducts, i),
                    ],
                  )
                ],
              ),
            );
          }
          if (state is GetAllProductsFailure) {
            return const Text("Ocorreu um erro ao requisitar lista de produtos");
          }
          return const ProductsPageShimmer();
        },
      ),
    );
  }

  Container _buttonToProductDetail(BuildContext context, List<Product> listProducts, int i) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () async {
                if (widget.isEdit) {
                  await context
                      .pushNamed("products_detail_edit", queryParameters: {"products_id": "${listProducts[i].id}"});
                  getAllProductsController.add(GetAllProductsStarted(widget.idCategory));
                } else {
                  context.pushNamed("product_detail", queryParameters: {"idProd": listProducts[i].id.toString()});
                }
              },
              child: Ink(
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  SizedBox(
                    height: 150,
                    width: 120,
                    child: ImageDefault(url: listProducts[i].images.first),
                  ),
                  15.sizeW,
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          listProducts[i].title,
                          overflow: TextOverflow.fade,
                          style: Style.defaultTextStyle.copyWith(fontSize: 20),
                        ),
                        15.sizeH,
                        Text(
                          "R${listProducts[i].price},00",
                          style: Style.defaultTextStyle.copyWith(fontSize: 18),
                        ),
                        Text(
                          "6 produtos em estoque",
                          style: Style.defaultTextStyle.copyWith(fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Icon(Icons.chevron_right, color: ColorsApp.kPrimary)
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
