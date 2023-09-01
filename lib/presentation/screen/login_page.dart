import 'package:fake_store_joao/presentation/commum_widgets/resumed_sizedbox.dart';
import 'package:fake_store_joao/core/themes/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FractionallySizedBox(
              widthFactor: 0.9,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Realize o login para continuar',
                            style:
                                Style.defaultTextStyle.copyWith(fontSize: 20),
                          ),
                        ],
                      ),
                      35.sizeH,
                      Text(
                        'E-mail',
                        style: Style.defaultTextStyle
                            .copyWith(color: Colors.grey, fontSize: 17),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          focusColor: Colors.white,
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        cursorColor: Colors.grey,
                      ),
                      25.sizeH,
                      Text(
                        'Senha',
                        style: Style.defaultTextStyle
                            .copyWith(color: Colors.grey, fontSize: 17),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          focusColor: Colors.white,
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        cursorColor: Colors.grey,
                      ),
                      25.sizeH,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Esqueci minha senha',
                            style:
                                Style.defaultTextStyle.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                      25.sizeH,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Material(
                            child: InkWell(
                              onTap: () {
                                context.push("/home");
                              },
                              child: Ink(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 7),
                                  color: Colors.lightBlue,
                                  child: Center(
                                      child: Text(
                                    "Entrar",
                                    style: Style.defaultTextStyle.copyWith(
                                        fontSize: 17, color: Colors.white),
                                  ))),
                            ),
                          ))
                        ],
                      ),
                      20.sizeH,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: InkWell(
                            onTap: () {},
                            child: Ink(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                color: Colors.white,
                                child: Center(
                                    child: Text(
                                  "Cadastrar-se",
                                  style: Style.defaultTextStyle.copyWith(
                                      fontSize: 17,
                                      color: Colors.lightBlue,
                                      fontWeight: FontWeight.w500),
                                ))),
                          ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
