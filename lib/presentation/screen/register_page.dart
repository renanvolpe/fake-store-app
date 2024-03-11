import 'package:another_flushbar/flushbar.dart';
import 'package:fake_store_joao/core/themes/style.dart';
import 'package:fake_store_joao/data/models/user_create.dart';
import 'package:fake_store_joao/data/repositories/users_repository.dart';
import 'package:fake_store_joao/logic/bloc/crate_user/create_user_bloc.dart';
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
          Flushbar(
            title: 'Cadastro criado com sucesso',
            backgroundColor: Colors.green,
            flushbarPosition: FlushbarPosition.TOP,
            message: 'Faça login para continuar',
            duration: const Duration(seconds: 3),
          ).show(context);
        }
        if (state is CreateUserFailure) {
          Flushbar(
            title: 'Erro ao criar conta',
            backgroundColor: Colors.red,
            flushbarPosition: FlushbarPosition.TOP,
            message: state.errorMessage,
            duration: const Duration(seconds: 5),
          ).show(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Cadastre-se para nova conta"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                45.sizeH,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(alignment: Alignment.center, children: [
                      CircleAvatar(
                        radius: 55,
                        backgroundColor: Colors.lightBlue.shade100,
                        child: const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 55,
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                              decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(50)),
                              padding: const EdgeInsets.all(5),
                              child: const Icon(
                                Icons.edit,
                                size: 20,
                                color: Colors.white,
                              )))
                    ])
                  ],
                ),
                35.sizeH,
                Row(
                  children: [
                    5.sizeW,
                    Text(
                      "E-mail",
                      style: Style.defaultTextStyle,
                    ),
                  ],
                ),
                5.sizeH,
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      hintText: "Escreva seu e-mail aqui",
                      hintStyle: Style.hintTextStyle),
                ),
                20.sizeH,
                Row(
                  children: [
                    5.sizeW,
                    Text(
                      "Nome",
                      style: Style.defaultTextStyle,
                    ),
                  ],
                ),
                5.sizeH,
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      hintText: "Escreva seu e-mail aqui",
                      hintStyle: Style.hintTextStyle),
                ),
                20.sizeH,
                Row(
                  children: [
                    5.sizeW,
                    Text(
                      "Senha",
                      style: Style.defaultTextStyle,
                    ),
                  ],
                ),
                5.sizeH,
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      hintText: "Escreva seu e-mail aqui",
                      hintStyle: Style.hintTextStyle),
                ),
                20.sizeH,
                Row(
                  children: [
                    5.sizeW,
                    Text(
                      "Confirmar Senha",
                      style: Style.defaultTextStyle,
                    ),
                  ],
                ),
                5.sizeH,
                TextFormField(
                  controller: confirmPassController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      hintText: "Escreva seu e-mail aqui",
                      hintStyle: Style.hintTextStyle),
                ),
                100.sizeH,
                BlocBuilder<CreateUserBloc, CreateUserState>(
                  bloc: createUserController,
                  builder: (context, state) {
                    if (state is CreateUserProgress) {
                      return InkWell(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Ink(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.lightBlue,
                              ),
                              child: const Center(
                                  child: SizedBox(
                                      height: 17,
                                      width: 17,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.white,
                                      ))),
                            ),
                          ),
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
                              role: "Costumer");
                          createUserController.add(CreateUserStarted(userCreate));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Ink(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.lightBlue,
                                ),
                                child: Center(
                                    child: Text(
                                  "Criar conta",
                                  style: Style.defaultLightTextStyle,
                                )),
                              ),
                            ),
                          ],
                        ));
                  },
                ),
                20.sizeH,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
