import 'package:fake_store_joao/core/themes/colors_app.dart';
import 'package:fake_store_joao/core/themes/style.dart';
import 'package:fake_store_joao/data/models/product.dart';
import 'package:fake_store_joao/data/repositories/products_repository.dart';
import 'package:fake_store_joao/logic/bloc/get_all_products/get_all_products_bloc.dart';
import 'package:fake_store_joao/core/default/image_default.dart';
import 'package:fake_store_joao/presentation/commum_widgets/resumed_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key, required this.idCategory, this.isEdit = false});
  final int idCategory;
  final bool isEdit;
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
      body: BlocBuilder<GetAllProductsBloc, GetAllProductsState>(
        bloc: getAllProductsController,
        builder: (context, state) {
          if (state is GetAllProductsSuccess) {
            List<Product> listProducts = state.listProducts;
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        for (int i = 0; i < listProducts.length; i++)
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                            child: Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () async {
                                      if (widget.isEdit) {
                                        await context.push(
                                            "/home/categoriesEdit/${widget.idCategory}/productsEdit/${listProducts[i].id}");
                                        getAllProductsController.add(GetAllProductsStarted(widget.idCategory));
                                      } else {
                                        context.push(
                                            "/home/categories/${widget.idCategory}/products/${listProducts[i].id}");
                                      }
                                    },
                                    child: Ink(
                                      decoration:
                                          BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
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
                                              30.sizeH,
                                              Text(
                                                "R,${listProducts[i].price}",
                                                style: Style.priceProductTextStyle.copyWith(fontSize: 18),
                                              ),
                                              Text(
                                                "6 produtos em estoque",
                                                style: Style.defaultTextStyle.copyWith(fontSize: 14),
                                              )
                                            ],
                                          ),
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
          return const Center(
              child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  )));
        },
      ),
    );
  }
}
