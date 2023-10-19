import 'package:fake_store_joao/core/themes/colors_app.dart';
import 'package:fake_store_joao/core/themes/style.dart';
import 'package:fake_store_joao/presentation/commum_widgets/drawer_menu.dart';
import 'package:fake_store_joao/presentation/commum_widgets/resumed_sizedbox.dart';
import 'package:flutter/material.dart';

//this component is to wrap a standard scafold that has a drawer
class ScaffoldWithDrawe extends StatelessWidget {
  const ScaffoldWithDrawe({super.key, required this.body, required this.title});

  final Widget body;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        leading: IconButton(
          onPressed: () => scaffoldKey.currentState?.openDrawer(),
          icon: const Icon(Icons.menu),
          color: ColorsApp.kWhiteColor,
        ),
        centerTitle: true,
        title: Text(
          "$title",
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
      drawer:  DrawerMenu(scaffoldKey: scaffoldKey,),
      body: body,
    );
  }
}
