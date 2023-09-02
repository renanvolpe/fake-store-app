import 'package:fake_store_joao/core/themes/colors_app.dart';
import 'package:fake_store_joao/core/themes/style.dart';
import 'package:fake_store_joao/presentation/commum_widgets/resumed_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
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
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height,
                child: ListView.separated(
                  itemCount: 4,
                  separatorBuilder: (context, index) => 15.sizeH,
                  itemBuilder: (context, index) => Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () => context.push("/categories/products"),
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
                                          color: Colors
                                              .black, // TODO put the image here
                                          height: 200,
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Nome da categoria",
                                          style: Style.defaultTextStyle
                                              .copyWith(fontSize: 22),
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
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: 4,
                                                    separatorBuilder:
                                                        (context, index) =>
                                                            15.sizeW,
                                                    itemBuilder:
                                                        (context, index) =>
                                                            Container(
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
      ),
    );
  }
}
