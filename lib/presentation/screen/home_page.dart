import 'package:fake_store_joao/core/themes/colors_app.dart';
import 'package:fake_store_joao/core/themes/style.dart';
import 'package:fake_store_joao/presentation/commum_widgets/drawer_menu.dart';
import 'package:fake_store_joao/presentation/commum_widgets/resumed_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //key to use to open drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        leading: IconButton(
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          icon: const Icon(Icons.menu),
          color: ColorsApp.kWhiteColor,
        ),
        centerTitle: true,
        title: Text(
          "SalgReis Store",
          style: Style.defaultLightTextStyle.copyWith(fontSize: 30),
        ),
        actions: [
          Icon(
            Icons.shopping_cart,
            color: ColorsApp.kWhiteColor,
          ),
          15.sizeW
        ],
      ),
      drawer: const DrawerMenu(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            20.sizeH,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => context.push("/categories"),
                    child: Ink(
                      color: ColorsApp.kWhiteColor,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25),
                          child: Text(
                            "Seleciona por categorias aqui",
                            style:
                                Style.defaultTextStyle.copyWith(fontSize: 24),
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
            StaggeredGrid.count(
              crossAxisCount: 4,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              children: [
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 2,
                  child: Container(
                      color: Colors.amber,
                      margin: const EdgeInsets.all(1),
                      child: const Text("index: 0")),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Container(
                      color: Colors.amber,
                      margin: const EdgeInsets.all(1),
                      child: const Text("index: 1")),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: Container(
                      color: Colors.amber,
                      margin: const EdgeInsets.all(1),
                      child: const Text("index: 2")),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: Container(
                      color: Colors.amber,
                      margin: const EdgeInsets.all(1),
                      child: const Text("index: 3")),
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
                  child: Container(
                      color: Colors.amber, child: const Text("index: 0")),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Container(
                      color: Colors.amber,
                      margin: const EdgeInsets.all(1),
                      child: const Text("index: 1")),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: Container(
                      color: Colors.amber,
                      margin: const EdgeInsets.all(1),
                      child: const Text("index: 2")),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: Container(
                      color: Colors.amber,
                      margin: const EdgeInsets.all(1),
                      child: const Text("index: 3")),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 4,
                  mainAxisCellCount: 2,
                  child: Container(
                      color: Colors.amber,
                      margin: const EdgeInsets.all(1),
                      child: const Text("index: 4")),
                ),
              ],
            ),
            25.sizeH
          ],
        ),
      ),
    );
  }
}
