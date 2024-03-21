import 'package:fake_store_joao/core/themes/colors_app.dart';
import 'package:fake_store_joao/core/themes/style.dart';
import 'package:fake_store_joao/data/models/profile/profile.dart';
import 'package:fake_store_joao/presentation/commum_widgets/app_flushbars.dart';
import 'package:fake_store_joao/presentation/commum_widgets/resumed_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

//this is component of "left menu"
class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;

  bool checkCurrentRoute(context, String newPath) {
    if (newPath == GoRouterState.of(context).uri.toString()) return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    var profileInstance = GetIt.I.get<Profile>();
    return Drawer(
      shape: Border.all(width: 0),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: ColorsApp.kPrimary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  width: 100,
                  "assets/images/logo-white-no-background.png",
                ),
                15.sizeH,
                Text(
                  'Hello, ${profileInstance.user.name.value}',
                  style: Style.defaultLightTextStyle.copyWith(fontSize: 22),
                ),
              ],
            ),
          ),
          ListTile(
              leading: const Icon(Icons.home),
              title: Text('Home', style: Style.defaultTextStyle),
              onTap: () {
                context.pushReplacement("/home");
              }),
          profileInstance.user.role.contains("admin")
              ? ListTile(
                  leading: const Icon(Icons.list),
                  title: Text('My products', style: Style.defaultTextStyle),
                  onTap: () {
                    context.pushNamed("categories_edit");
                  },
                )
              : ListTile(
                  leading: const Icon(Icons.list),
                  title: Text('My Orders', style: Style.defaultTextStyle),
                  onTap: () => flushbarNotImplementedYet(context)),
          ListTile(
              leading: const Icon(Icons.account_circle_sharp),
              title: Text('My Account', style: Style.defaultTextStyle),
              onTap: () => context.go("/account")),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text('Logout', style: Style.defaultTextStyle),
            onTap: () async {
              scaffoldKey.currentState?.closeDrawer();
              await GetIt.I.unregister<Profile>(); // not do that here, export functions
              context.go("/");
            },
          ),
        ],
      ),
    );
  }
}
