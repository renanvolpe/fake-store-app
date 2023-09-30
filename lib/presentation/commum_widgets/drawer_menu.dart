import 'package:fake_store_joao/core/themes/style.dart';
import 'package:fake_store_joao/presentation/commum_widgets/flushbar_function_not_implemented.dart';
import 'package:fake_store_joao/presentation/commum_widgets/resumed_sizedbox.dart';
import 'package:flutter/material.dart';
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
    return Drawer(
      shape: Border.all(width: 0),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
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
                  'Olá, João Salgueiro',
                  style: Style.defaultLightTextStyle.copyWith(fontSize: 22),
                ),
              ],
            ),
          ),
          ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Início'),
              onTap: () {
                if (checkCurrentRoute(context, "/home")) context.go("/home");
              }),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Meus produtos'),
            onTap: () {
              //TODO the admin part to call the products of store
            },
          ),
          ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Meus Pedidos'),
              onTap: () => flushbarNotImplementedYet(context)),
          ListTile(
              leading: const Icon(Icons.account_circle_sharp),
              title: const Text('Meu Perfil'),
              onTap: () => context.go("/account")),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Sair'),
            onTap: () {
              scaffoldKey.currentState?.closeDrawer();
              context.go("/");
            },
          ),
        ],
      ),
    );
  }
}
