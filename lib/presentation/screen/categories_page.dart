import 'package:fake_store_joao/core/default/appbar_default.dart';
import 'package:fake_store_joao/core/default/image_default.dart';
import 'package:fake_store_joao/core/themes/colors_app.dart';
import 'package:fake_store_joao/core/themes/style.dart';
import 'package:fake_store_joao/data/models/category.dart';
import 'package:fake_store_joao/data/models/profile.dart';
import 'package:fake_store_joao/data/repositories/categories_repository.dart';
import 'package:fake_store_joao/logic/bloc/get_all_categories/get_all_categories_bloc.dart';
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
                      itemBuilder: (context, index) => Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () => context.push("/home/categories/${listCategory[index].id}", ),
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
                                              borderRadius: const BorderRadius.only(
                                                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                                              child: SizedBox(
                                                height: 200,
                                                child: ImageDefault(
                                                  radius: 0,
                                                  height: 200,
                                                  url: listCategory[index].image,
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
                                              listCategory[index].name,
                                              style: Style.defaultTextStyle.copyWith(fontSize: 22),
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
                      ),
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
