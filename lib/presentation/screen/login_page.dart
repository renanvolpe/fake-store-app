import 'package:another_flushbar/flushbar.dart';
import 'package:fake_store_joao/data/repositories/authentication_repository.dart';
import 'package:fake_store_joao/logic/bloc/get_user/get_user_bloc.dart';
import 'package:fake_store_joao/logic/bloc/login/login_bloc.dart';
import 'package:fake_store_joao/presentation/commum_widgets/resumed_sizedbox.dart';
import 'package:fake_store_joao/core/themes/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
   LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginBloc loginController;
  late GetUserBloc getUserController;
  @override
  void initState() {
    loginController = LoginBloc(AuthenticationRepository());
    getUserController = GetUserBloc(AuthenticationRepository());
    super.initState();
  }

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<LoginBloc, LoginState>(
          bloc: loginController,
          listener: (context, state) async {
            if (state is LoginSuccess) {
              //it calls the get it to save Users data
              getUserController.add(GetUserStarted(state.token));
              
            }
            if (state is LoginFailure) {
              // ignore: use_build_context_synchronously
              Flushbar(
                title: 'Erro de login',
                backgroundColor: Colors.red,
                flushbarPosition: FlushbarPosition.BOTTOM,
                message: 'Revise as infomações de login',
                duration:  Duration(seconds: 2),
              ).show(context);
            }
          },
        ),
        BlocListener<GetUserBloc, GetUserState>(
          bloc: getUserController,
          listener: (context, state) async{
            if(state is GetUserSuccess){
              await Flushbar(
                title: 'Login realizado com sucesso',
                backgroundColor: Colors.green,
                flushbarPosition: FlushbarPosition.BOTTOM,
                message: 'Aprecia as funcionalidades do app',
                duration:  Duration(milliseconds: 1500),
              ).show(context);
              // ignore: use_build_context_synchronously
              context.push("/home");
            }
            if(state is GetUserFailure){
              Flushbar(
                title: 'Erro de login',
                backgroundColor: Colors.red,
                flushbarPosition: FlushbarPosition.BOTTOM,
                message: 'Revise as infomações de login',
                duration:  Duration(seconds: 2),
              ).show(context);
            }
            
          },
        ),
      ],
      child: Scaffold(
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
                       EdgeInsets.symmetric(horizontal: 20, vertical: 50),
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
                          controller: emailController,
                          decoration:  InputDecoration(
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
                          controller: passwordController,
                          decoration:  InputDecoration(
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
                                onTap: () => loginController.add(LoginStarted(
                                    emailController.text,
                                    passwordController.text)),
                                child: Ink(
                                    padding:
                                         EdgeInsets.symmetric(vertical: 7),
                                    color: Colors.lightBlue,
                                    child: Center(
                                        child: BlocBuilder<GetUserBloc,
                                            GetUserState>(
                                      bloc: getUserController,
                                      builder: (context, stateGetUser) {
                                        return BlocBuilder<LoginBloc,
                                            LoginState>(
                                          bloc: loginController,
                                          builder: (context, state) {
                                            if (state is LoginProgress ||
                                                stateGetUser
                                                    is GetUserProgress) {
                                              return  Center(
                                                  child: SizedBox(
                                                      height: 22,
                                                      width: 22,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: Colors.white,
                                                      )));
                                            }
                                            return Text(
                                              "Entrar",
                                              style: Style.defaultTextStyle
                                                  .copyWith(
                                                      fontSize: 17,
                                                      color: Colors.white),
                                            );
                                          },
                                        );
                                      },
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
                              onTap: () {
                                context.push("/register");
                              },
                              child: Ink(
                                  padding:
                                       EdgeInsets.symmetric(vertical: 5),
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
      ),
    );
  }
}
