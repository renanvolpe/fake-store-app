import 'package:fake_store_joao/core/default/appbar_default.dart';
import 'package:fake_store_joao/core/default/image_default.dart';
import 'package:fake_store_joao/core/themes/colors_app.dart';
import 'package:fake_store_joao/data/models/category.dart';
import 'package:fake_store_joao/logic/bloc/edit_category/edit_category_bloc.dart';
import 'package:fake_store_joao/logic/bloc/get_all_categories/get_all_categories_bloc.dart';
import 'package:fake_store_joao/logic/bloc/get_all_products/get_all_products_bloc.dart';
import 'package:fake_store_joao/logic/get_it/init_get_it.dart';
import 'package:fake_store_joao/presentation/commum_widgets/categories_page_shimmer.dart';
import 'package:fake_store_joao/presentation/commum_widgets/resumed_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({
    super.key,
  });

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  late GetAllCategoriesBloc categoriesController;
  List<TextEditingController> listFields = [];

  @override
  void initState() {
    categoriesController = binds.get<GetAllCategoriesBloc>();
    categoriesController.add(GetAllCategoriesStarted());

    super.initState();
  }

  // _getTitle() => widget.isToEdit ? "Edit a cateogry" : "Select a category";

  _createListFields(List<Category> listCategory) {
    listFields.addAll(listCategory.map((category) => TextEditingController(text: category.name)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.kBackground,
      appBar: AppbarDefault(context, "Edit a cateogry"),
      body: BlocBuilder<GetAllCategoriesBloc, GetAllCategoriesState>(
        bloc: categoriesController,
        builder: (context, state) {
          if (state is GetAllCategoriesSuccess) {
            List<Category> listCategory = state.category;
            _createListFields(listCategory);
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
                        itemBuilder: (context, index) => SectionAndButtonCategory(
                              category: listCategory[index],
                              field: listFields[index],
                            )),
                  ),
                  15.sizeH
                ],
              ),
            );
          }
          if (state is GetAllCategoriesFailure) {
            return const Text("We found a error, try again later");
          }

          return const CategoriesPageShimmer();
        },
      ),
    );
  }
}

class SectionAndButtonCategory extends StatelessWidget {
  const SectionAndButtonCategory({super.key, required this.category, required this.field});

  final Category category;
  final TextEditingController field;

  // @override
  @override
  Widget build(BuildContext context) {
    final GetAllCategoriesBloc getAllCategoriesBloc = binds.get<GetAllCategoriesBloc>();
    final EditCategoryBloc editCategoryController = binds.get<EditCategoryBloc>();
    final GetAllProductsBloc getAllProductsBloc = binds.get<GetAllProductsBloc>();
    getAllProductsBloc.add(GetAllProductsStarted());
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () => context.pushNamed("products_edit",
                queryParameters: {"nameCat": category.name, "idCat": category.id.toString()}),
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
                                url: category.image,
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
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: field,
                                ),
                              ),
                              15.sizeW,
                              BlocConsumer<EditCategoryBloc, EditCategoryState>(
                                bloc: editCategoryController,
                                listener: (context, state) {
                                  if (state is EditCategorySuccess) {
                                    getAllCategoriesBloc.add(GetAllCategoriesStarted());
                                  }
                                },
                                builder: (context, state) {
                                  if (state is EditCategoryProgress) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                  return InkWell(
                                      onTap: () {
                                        category.name = field.text;
                                        editCategoryController.add(EditCategoryStarted(category));
                                      },
                                      child: const Icon(Icons.edit));
                                },
                              )
                            ],
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
                                                color: ColorsApp.kPrimary,
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

class SectionAndButtonCategoryEdit extends StatelessWidget {
  const SectionAndButtonCategoryEdit({
    super.key,
    required this.category,
    required this.field,
  });

  final Category category;
  final TextEditingController field;

  @override
  Widget build(BuildContext context) {
    final GetAllCategoriesBloc categoriesController = binds.get<GetAllCategoriesBloc>();
    final EditCategoryBloc editCategoryController = binds.get<EditCategoryBloc>();
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () => context.pushNamed("products_edit", queryParameters: {"idCat": "${category.id}"}),
            child: Ink(
              child: Card(
                shape: Border.all(width: 0),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.black,
                            height: 200,
                            child: ImageDefault(
                              url: category.image,
                              fit: BoxFit.fill,
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
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: field,
                                ),
                              ),
                              15.sizeW,
                              BlocConsumer<EditCategoryBloc, EditCategoryState>(
                                bloc: editCategoryController,
                                listener: (context, state) {
                                  if (state is EditCategorySuccess) {
                                    categoriesController.add(GetAllCategoriesStarted());
                                  }
                                },
                                builder: (context, state) {
                                  if (state is EditCategoryProgress) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                  return InkWell(
                                      onTap: () {
                                        category.name = field.text;
                                        editCategoryController.add(EditCategoryStarted(category));
                                      },
                                      child: const Icon(Icons.edit));
                                },
                              )
                            ],
                          ),
                          15.sizeH,
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 80,
                                  child: Center(
                                    child: ListView.separated(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 4,
                                      separatorBuilder: (context, index) => 15.sizeW,
                                      itemBuilder: (context, index) => Container(
                                        width: 70,
                                        color: Colors.amber,
                                      ),
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
