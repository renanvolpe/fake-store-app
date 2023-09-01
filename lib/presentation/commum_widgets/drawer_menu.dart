import 'package:fake_store_joao/core/themes/style.dart';
import 'package:fake_store_joao/presentation/commum_widgets/resumed_sizedbox.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
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
              //TODO return to home page if its not home page
            },
          ),
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
            onTap: () {
              //TODO call flushbar to future implementation
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_circle_sharp),
            title: const Text('Meu Perfil'),
            onTap: () {
              //TODO go to my account page
            },
          ),
        ],
      ),
    );
  }
}
