// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fake_store_joao/core/themes/colors_app.dart';
import 'package:fake_store_joao/logic/bloc/get_user/get_user_bloc.dart';
import 'package:fake_store_joao/logic/get_it/init_get_it.dart';
import 'package:fake_store_joao/presentation/commum_widgets/resumed_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({
    Key? key,
    required this.token,
  }) : super(key: key);
  final String token;

  @override
  Widget build(BuildContext context) {
    final GetUserBloc getUserController = binds.get<GetUserBloc>();
    getUserController.add(GetUserStarted(token));
    return BlocListener<GetUserBloc, GetUserState>(
      bloc: getUserController,
      listener: (context, state) async {
        if (state is GetUserSuccess) {
          context.pushReplacement("/home");
        }
      },
      child: Scaffold(
        backgroundColor: ColorsApp.kPrimary,
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.sizeOf(context).width, 80),
          child: SafeArea(
            child: Image.asset(
              "assets/images/logo-white-no-background.png",
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpinKitCircle(
                color: ColorsApp.kWhite,
                size: 50.0,
              ),
              100.sizeH
            ],
          ),
        ),
      ),
    );
  }
}
