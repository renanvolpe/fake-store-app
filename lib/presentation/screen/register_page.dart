import 'package:fake_store_joao/core/themes/style.dart';
import 'package:fake_store_joao/presentation/commum_widgets/resumed_sizedbox.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Cadastre-se para nova conta"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
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
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(50)),
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
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
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
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
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
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
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
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  hintText: "Escreva seu e-mail aqui",
                  hintStyle: Style.hintTextStyle),
            ),
            const Spacer(),
            InkWell(
                onTap: () {
                  Navigator.pop(context);
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
                )),
            20.sizeH,
          ],
        ),
      ),
    );
  }
}
