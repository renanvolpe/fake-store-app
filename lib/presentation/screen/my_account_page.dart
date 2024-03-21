import 'package:fake_store_joao/core/themes/style.dart';
import 'package:fake_store_joao/data/models/profile/profile.dart';
import 'package:fake_store_joao/data/models/profile/profile_controller.dart';
import 'package:fake_store_joao/data/models/profile/user/user.dart';
import 'package:fake_store_joao/presentation/commum_widgets/button_update_user.dart';
import 'package:fake_store_joao/presentation/commum_widgets/resumed_sizedbox.dart';
import 'package:fake_store_joao/presentation/commum_widgets/scafold_with_drawer.dart';
import 'package:fake_store_joao/presentation/commum_widgets/text_field_edit_account.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({super.key});

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  late ProfileController controller;
  late User user;

  @override
  void initState() {
    controller = ProfileController(GetIt.I.get<Profile>(), GlobalKey<FormState>());
    user = controller.user;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithDrawe(
      title: "Minha conta",
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Altere seu dados",
                        style: Style.defaultTextStyle.copyWith(fontSize: 20),
                      )
                    ],
                  ),
                  30.sizeH,
                  TextFieldRegister(
                    field: user.name,
                  ),
                  15.sizeH,
                  TextFieldRegister(
                    isBlock: true,
                    field: user.email,
                  ),
                  15.sizeH,
                  TextFieldRegister(
                    isBlock: true,
                    field: user.password,
                  ),
                  50.sizeH,
                  ButtonUpdateUser(controller: controller, user: user)
                ],
              ),
            ),
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
          ),
          20.sizeH,
          const Divider(
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
