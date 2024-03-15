import 'package:fake_store_joao/core/default/image_default.dart';
import 'package:fake_store_joao/core/themes/colors_app.dart';
import 'package:fake_store_joao/data/models/profile/profile.dart';
import 'package:fake_store_joao/presentation/commum_widgets/drawer_menu.dart';
import 'package:fake_store_joao/presentation/commum_widgets/flushbar_function_not_implemented.dart';
import 'package:fake_store_joao/presentation/commum_widgets/resumed_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

//this component is to wrap a standard scafold that has a drawer
class ScaffoldWithDrawe extends StatefulWidget {
  const ScaffoldWithDrawe({super.key, required this.body, required this.title});

  final Widget body;
  final String? title;

  @override
  State<ScaffoldWithDrawe> createState() => _ScaffoldWithDraweState();
}

class _ScaffoldWithDraweState extends State<ScaffoldWithDrawe> {
  @override
  Widget build(BuildContext context) {
    String url = GetIt.I.get<Profile>().user.avatar;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      backgroundColor: ColorsApp.kWhite,
      key: scaffoldKey,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: ColorsApp.kWhite,
        leading: IconButton(
          onPressed: () => scaffoldKey.currentState?.openDrawer(),
          icon: Icon(
            Icons.menu,
            color: ColorsApp.kBlack,
          ),
          color: ColorsApp.kWhite,
        ),
        centerTitle: true,
        title: SizedBox(width: 80, child: Image.asset("assets/images/logo-dark-no-background.png")),
        actions: [
          InkWell(
              onTap: () => flushbarNotImplementedYet(context),
              child: SizedBox(
                  width: 45,
                  height: 45,
                  child: ImageDefault(
                    url: url,
                    radius: 50,
                  ))),
          15.sizeW
        ],
      ),
      drawer: DrawerMenu(
        scaffoldKey: scaffoldKey,
      ),
      body: widget.body,
    );
  }
}
