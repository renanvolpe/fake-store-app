import 'package:fake_store_joao/core/themes/colors_app.dart';
import 'package:fake_store_joao/core/themes/style.dart';
import 'package:fake_store_joao/data/models/category.dart';
import 'package:fake_store_joao/data/models/profile.dart';
import 'package:fake_store_joao/data/repositories/categories_repository.dart';
import 'package:fake_store_joao/logic/bloc/get_all_categories/get_all_categories_bloc.dart';
import 'package:fake_store_joao/core/default/image_default.dart';
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
          "Selecione a categoria",
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
      body: BlocBuilder<GetAllCategoriesBloc, GetAllCategoriesState>(
        bloc: categoriesController,
        builder: (context, state) {
          if (state is GetAllCategoriesSuccess) {
            List<Category> listCategory = state.category;
            return SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height,
                      child: ListView.separated(
                        itemCount: listCategory.length,
                        separatorBuilder: (context, index) => 15.sizeH,
                        itemBuilder: (context, index) => Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () => context.push("/home/categories/${listCategory[index].id}"),
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
                                                  url: listCategory[index].image,
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
                    )
                  ],
                ),
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
