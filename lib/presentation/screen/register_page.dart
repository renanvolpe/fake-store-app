import 'package:fake_store_joao/core/default/appbar_default.dart';
import 'package:fake_store_joao/core/default/button_default.dart';
import 'package:fake_store_joao/core/default/circular_progress_indicator.dart';
import 'package:fake_store_joao/core/default/textfield_decoration_default.dart';
import 'package:fake_store_joao/core/themes/colors_app.dart';
import 'package:fake_store_joao/core/themes/style.dart';
import 'package:fake_store_joao/data/models/user_create.dart';
import 'package:fake_store_joao/data/repositories/users_repository.dart';
import 'package:fake_store_joao/logic/bloc/crate_user/create_user_bloc.dart';
import 'package:fake_store_joao/presentation/commum_widgets/app_flushbars.dart';
import 'package:fake_store_joao/presentation/commum_widgets/resumed_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  late CreateUserBloc createUserController;
  @override
  void initState() {
    createUserController = CreateUserBloc(UserRepository());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateUserBloc, CreateUserState>(
      bloc: createUserController,
      listener: (context, state) {
        if (state is CreateUserSuccess) {
          Navigator.pop(context);
          flushbarSuccess(context, 'Profile updated', 'Test other features in this app');
        }
        if (state is CreateUserFailure) {
          flushbarError(context, 'Error in register', 'review your profile data');
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorsApp.kWhite,
        appBar: AppbarDefault(context, "Cadastre-se"),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              45.sizeH,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(alignment: Alignment.center, children: [
                    CircleAvatar(
                      radius: 55,
                      backgroundColor: ColorsApp.kPrimary,
                      child: Icon(
                        Icons.person,
                        color: ColorsApp.kWhite,
                        size: 55,
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                            decoration: BoxDecoration(color: ColorsApp.kBlack, borderRadius: BorderRadius.circular(50)),
                            padding: const EdgeInsets.all(5),
                            child: Icon(
                              Icons.edit,
                              size: 20,
                              color: ColorsApp.kWhite,
                            )))
                  ])
                ],
              ),
              25.sizeH,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Enter the details below to register", style: Style.defaultTextStyle.copyWith(fontSize: 18))
                ],
              ),
              25.sizeH,
              TextFormField(
                controller: emailController,
                decoration: textfieldDecorationDefault(hintText: "Email"),
              ),
              20.sizeH,
              5.sizeH,
              TextFormField(
                controller: nameController,
                decoration: textfieldDecorationDefault(hintText: "Name"),
              ),
              20.sizeH,
              TextFormField(
                controller: passwordController,
                decoration: textfieldDecorationDefault(hintText: "Password"),
              ),
              20.sizeH,
              TextFormField(
                controller: confirmPassController,
                decoration: textfieldDecorationDefault(hintText: "Confirm password"),
              ),
              const Spacer(),
              BlocBuilder<CreateUserBloc, CreateUserState>(
                bloc: createUserController,
                builder: (context, state) {
                  if (state is CreateUserProgress) {
                    return const InkWell(
                        child: Row(
                      children: [
                        Expanded(child: ButtonBorderPrimary(child: CircularProgressIndicatorDefault(isLight: true))),
                      ],
                    ));
                  }
                  return InkWell(
                      onTap: () {
                        var userCreate = UserCreate(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            avatar: "https://api.lorem.space/image/face?w=640&h=480",
                            role: "customer");
                        createUserController.add(CreateUserStarted(userCreate));
                      },
                      child: const Row(
                        children: [
                          Expanded(child: ButtonBorderPrimary(text: "Criar conta")),
                        ],
                      ));
                },
              ),
              30.sizeH,
            ],
          ),
        ),
      ),
    );
  }
}
