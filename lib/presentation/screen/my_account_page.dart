import 'package:fake_store_joao/core/themes/style.dart';
import 'package:fake_store_joao/presentation/commum_widgets/resumed_sizedbox.dart';
import 'package:fake_store_joao/presentation/commum_widgets/scafold_with_drawer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithDrawe(
      title: "Minha conta",
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(
            color: Colors.white,
          ),
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
            title: Text(
              "Name person",
              style: Style.defaultLightTextStyle.copyWith(fontSize: 22),
            ),
            subtitle: Text("E-mail title",
                style: Style.defaultLightTextStyle.copyWith(fontSize: 16)),
            trailing: const CircleAvatar(
              radius: 35,
            ),
          ),
          const Divider(
            color: Colors.white,
          ),
          20.sizeH,
          InkWell(
            onTap: () => context.go("/"),
            child: Ink(
                padding:
                    const EdgeInsets.symmetric(vertical: 9, horizontal: 15),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    8.sizeW,
                    Text("Logout",
                        style:
                            Style.defaultLightTextStyle.copyWith(fontSize: 22)),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
