import 'package:fake_store_joao/core/default/appbar_default.dart';
import 'package:fake_store_joao/core/default/image_default.dart';
import 'package:fake_store_joao/core/themes/colors_app.dart';
import 'package:fake_store_joao/data/models/category.dart';
import 'package:fake_store_joao/data/models/profile/profile.dart';
import 'package:fake_store_joao/data/repositories/categories_repository.dart';
import 'package:fake_store_joao/logic/bloc/edit_category/edit_category_bloc.dart';
import 'package:fake_store_joao/logic/bloc/get_all_categories/get_all_categories_bloc.dart';
import 'package:fake_store_joao/logic/get_it/init_get_it.dart';
import 'package:fake_store_joao/presentation/commum_widgets/resumed_sizedbox.dart';
import 'package:fake_store_joao/presentation/screen/categories_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class CategoriesEditPage extends StatefulWidget {
  const CategoriesEditPage({super.key});

  @override
  State<CategoriesEditPage> createState() => _CategoriesEditPageState();
}

class _CategoriesEditPageState extends State<CategoriesEditPage> {
  late Profile profileInstance;
  late GetAllCategoriesBloc categoriesController;

  List<TextEditingController> listForms = [];
  @override
  void initState() {
    profileInstance = GetIt.I.get<Profile>();
    categoriesController = binds.get<GetAllCategoriesBloc>();
    categoriesController.add(GetAllCategoriesStarted());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.kBackground,
      appBar: AppbarDefault(context, "Edite a categoria"),
      body: BlocBuilder<GetAllCategoriesBloc, GetAllCategoriesState>(
        bloc: categoriesController,
        builder: (context, state) {
          if (state is GetAllCategoriesSuccess) {
            List<Category> listCategory = state.category;
            for (int i = 0; i < listCategory.length; i++) {
              listForms.add(TextEditingController(text: listCategory[i].name));
            }
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
                        itemBuilder: (context, index) => SectionAndButtonCategoryEdit(
                          category: listCategory[index],
                          field: listForms[index],
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

