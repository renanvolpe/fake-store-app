import 'package:fake_store_joao/core/themes/style.dart';
import 'package:fake_store_joao/data/models/profile.dart';
import 'package:fake_store_joao/presentation/commum_widgets/flushbar_function_not_implemented.dart';
import 'package:fake_store_joao/presentation/commum_widgets/resumed_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

//this is component of "left menu"
class DrawerMenu extends StatelessWidget {
   DrawerMenu({super.key, required this.scaffoldKey});
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
            decoration:  BoxDecoration(
              color: Color(0xFF03A9F4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SalgReis Store',
                  style: Style.defaultLightTextStyle.copyWith(fontSize: 40),
                ),
                15.sizeH,
                Text(
                  'Olá, ${profileInstance.user.name}',
                  style: Style.defaultLightTextStyle.copyWith(fontSize: 22),
                ),
              ],
            ),
          ),
          ListTile(
              leading:  Icon(Icons.home),
              title:  Text('Início'),
              onTap: () {
                context.go("/home");
              }),
          profileInstance.user.role.contains("admin")
              ? ListTile(
                  leading:  Icon(Icons.list),
                  title:  Text('Meus produtos'),
                  onTap: () {
                    context.push("/home/categoriesEdit");
                  },
                )
              : ListTile(
                  leading:  Icon(Icons.list),
                  title:  Text('Meus Pedidos'),
                  onTap: () => flushbarNotImplementedYet(context)),
          ListTile(
              leading:  Icon(Icons.account_circle_sharp),
              title:  Text('Meu Perfil'),
              onTap: () => context.go("/account")),
          ListTile(
            leading:  Icon(Icons.logout),
            title:  Text('Sair'),
            onTap: () async{
              scaffoldKey.currentState?.closeDrawer();
              await GetIt.I.unregister<Profile>();
              context.go("/");
            },
          ),
        ],
      ),
    );
  }
}
