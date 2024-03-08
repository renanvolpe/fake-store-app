import 'package:fake_store_joao/core/themes/style.dart';
import 'package:fake_store_joao/data/models/profile.dart';
import 'package:fake_store_joao/core/default/image_default.dart';
import 'package:fake_store_joao/presentation/commum_widgets/resumed_sizedbox.dart';
import 'package:fake_store_joao/presentation/commum_widgets/scafold_with_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    var profileInstance = GetIt.I.get<Profile>();
    return ScaffoldWithDrawe(
      title: "Minha conta",
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(
            color: Colors.white,
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
            title: Text(
              profileInstance.user.name,
              style: Style.defaultLightTextStyle.copyWith(fontSize: 22),
            ),
            subtitle: Text(profileInstance.user.email, style: Style.defaultLightTextStyle.copyWith(fontSize: 16)),
            trailing: CircleAvatar(
              radius: 35,
              child: ImageDefault(url: profileInstance.user.avatar),
            ),
          ),
          const Divider(
            color: Colors.white,
          ),
          20.sizeH,
          InkWell(
            onTap: () async {
              await GetIt.I.unregister<Profile>();
              context.go("/");
            },
            child: Ink(
                padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 15),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    8.sizeW,
                    Text("Logout", style: Style.defaultLightTextStyle.copyWith(fontSize: 22)),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
