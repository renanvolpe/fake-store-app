import 'package:fake_store_joao/core/default/button_default.dart';
import 'package:fake_store_joao/core/default/circular_progress_indicator.dart';
import 'package:fake_store_joao/core/default/textfield_decoration_default.dart';
import 'package:fake_store_joao/core/themes/colors_app.dart';
import 'package:fake_store_joao/core/themes/style.dart';
import 'package:fake_store_joao/data/repositories/authentication_repository.dart';
import 'package:fake_store_joao/logic/bloc/get_user/get_user_bloc.dart';
import 'package:fake_store_joao/logic/bloc/login/login_bloc.dart';
import 'package:fake_store_joao/presentation/commum_widgets/app_flushbars.dart';
import 'package:fake_store_joao/presentation/commum_widgets/resumed_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

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

  var emailController = TextEditingController(text: "joao@joao.com");
  var passwordController = TextEditingController(text: "1234");

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
              await flushbarError(context, 'Error login', 'Review your data');
            }
          },
        ),
        BlocListener<GetUserBloc, GetUserState>(
          bloc: getUserController,
          listener: (context, state) async {
            if (state is GetUserSuccess) {
              await flushbarSuccess(context, 'Login success', 'Test other features in this app');
              // ignore: use_build_context_synchronously
              context.pushReplacement("/home");
            }
            if (state is GetUserFailure) {
              await flushbarError(context, 'Error in login', 'review your address data');
            }
          },
        ),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background_image.jpg'),
              fit: BoxFit.cover, // Adjust as per your need
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      width: 200,
                      "assets/images/logo-no-background.png",
                    ),
                    20.sizeH,
                    Text(
                      'It´s a test app to show my abbilities',
                      textAlign: TextAlign.center,
                      style: Style.defaultLightTextStyle.copyWith(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                    150.sizeH,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        35.sizeH,
                        TextFormField(
                          controller: emailController,
                          readOnly: true,
                          decoration: textfieldDecorationDefault(hintText: "Email", prefixIcon: Icons.email_outlined),
                          cursorColor: Colors.grey,
                        ),
                        25.sizeH,
                        TextFormField(
                          controller: passwordController,
                          readOnly: true,
                          decoration:
                              textfieldDecorationDefault(hintText: "Password", prefixIcon: Icons.lock_outline_rounded),
                          cursorColor: Colors.grey,
                        ),
                        25.sizeH,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Forgot Password',
                              style: Style.defaultLightTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        25.sizeH,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: BlocBuilder<LoginBloc, LoginState>(
                              bloc: loginController,
                              builder: (context, state) {
                                if (state is LoginProgress) {
                                  return const InkWell(
                                    child: ButtonBorderPrimary(child: CircularProgressIndicatorDefault(isLight: true)),
                                  );
                                }
                                return ButtonBorderPrimary(
                                    onTap: () => loginController
                                        .add(LoginStarted(emailController.text, passwordController.text)),
                                    text: "Sign in");
                              },
                            ))
                          ],
                        ),
                        25.sizeH,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: InkWell(
                                  onTap: () {
                                    flushbarNotImplementedYet(context);
                                    // context.push("/register");
                                  },
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: Style.defaultLightTextStyle,
                                      children: <TextSpan>[
                                        const TextSpan(text: 'Didn´t have any account? '),
                                        TextSpan(
                                          text: 'Sign Up here',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            decoration: TextDecoration.underline,
                                            color: ColorsApp.kPrimary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
