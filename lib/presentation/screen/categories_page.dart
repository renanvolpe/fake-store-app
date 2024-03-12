import 'package:fake_store_joao/core/default/appbar_default.dart';
import 'package:fake_store_joao/core/default/image_default.dart';
import 'package:fake_store_joao/core/themes/colors_app.dart';
import 'package:fake_store_joao/core/themes/style.dart';
import 'package:fake_store_joao/data/models/category.dart';
import 'package:fake_store_joao/data/models/profile.dart';
import 'package:fake_store_joao/data/repositories/categories_repository.dart';
import 'package:fake_store_joao/data/repositories/products_repository.dart';
import 'package:fake_store_joao/logic/bloc/get_all_categories/get_all_categories_bloc.dart';
import 'package:fake_store_joao/logic/bloc/get_all_products/get_all_products_bloc.dart';
import 'package:fake_store_joao/presentation/commum_widgets/categories_page_shimmer.dart';
import 'package:fake_store_joao/presentation/commum_widgets/resumed_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  late Profile profileInstance;
  late GetAllCategoriesBloc categoriesController;

  @override
  void initState() {
    profileInstance = GetIt.I.get<Profile>();
    categoriesController = GetAllCategoriesBloc(CateogriesRepository());
    categoriesController.add(GetAllCategoriesStarted());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.kBackgroundColor,
      appBar: AppbarDefault(context, "Selecione a categoria"),
      body: BlocBuilder<GetAllCategoriesBloc, GetAllCategoriesState>(
        bloc: categoriesController,
        builder: (context, state) {
          if (state is GetAllCategoriesSuccess) {
            List<Category> listCategory = state.category;
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: listCategory.length,
                      separatorBuilder: (context, index) => 10.sizeH,
                      itemBuilder: (context, index) => SectionAndButtonCategory(category: listCategory[index]),
                    ),
                  ),
                  15.sizeH
                ],
              ),
            );
          }
          if (state is GetAllCategoriesFailure) {
            return const Text("Encontramos um erro, tente novamente mais tarde");
          }

          return const CategoriesPageShimmer();
        },
      ),
    );
  }
}

class SectionAndButtonCategory extends StatefulWidget {
  const SectionAndButtonCategory({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  State<SectionAndButtonCategory> createState() => _SectionAndButtonCategoryState();
}

class _SectionAndButtonCategoryState extends State<SectionAndButtonCategory> {
  late GetAllProductsBloc getAllProductsBloc;

  @override
  void initState() {
    getAllProductsBloc = GetAllProductsBloc(ProductRepository());
    getAllProductsBloc.add(GetAllProductsStarted(widget.category.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () => context.pushNamed("products",
                queryParameters: {"nameCat": widget.category.name, "idCat": widget.category.id.toString()}),
            child: Ink(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
                ),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                            child: SizedBox(
                              height: 200,
                              child: ImageDefault(
                                radius: 0,
                                height: 200,
                                url: widget.category.image,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.category.name,
                            style: Style.defaultTextStyle.copyWith(fontSize: 22),
                          ),
                          15.sizeH,
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 80,
                                  child: Center(
                                    child: BlocBuilder<GetAllProductsBloc, GetAllProductsState>(
                                      bloc: getAllProductsBloc,
                                      builder: (context, stateProd) {
                                        if (stateProd is GetAllProductsSuccess) {
                                          return ListView.separated(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: stateProd.listProducts.length,
                                            separatorBuilder: (context, index) => 15.sizeW,
                                            itemBuilder: (context, index) => SizedBox(
                                              width: 70,
                                              child: SizedBox(
                                                  width: 10,
                                                  height: 10,
                                                  child: ImageDefault(
                                                    url: stateProd.listProducts[index].images.first,
                                                    radius: 0,
                                                  )),
                                            ),
                                          );
                                        }
                                        if (stateProd is GetAllProductsFailure) {
                                          return const SizedBox();
                                        }
                                        return SizedBox(
                                          height: 80,
                                          child: Center(
                                            child: ListView.separated(
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount: 4,
                                              separatorBuilder: (context, index) => 15.sizeW,
                                              itemBuilder: (context, index) => Container(
                                                width: 70,
                                                color: Colors.lightBlue,
                                                child: const SizedBox(
                                                    width: 10,
                                                    height: 10,
                                                    child: Center(
                                                        child: CircularProgressIndicator(
                                                      color: Colors.white,
                                                    ))),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
