import 'package:another_flushbar/flushbar.dart';
import 'package:fake_store_joao/core/default/button_default.dart';
import 'package:fake_store_joao/data/models/profile/profile_controller.dart';
import 'package:fake_store_joao/data/models/profile/user/user.dart';
import 'package:fake_store_joao/data/repositories/users_repository.dart';
import 'package:fake_store_joao/logic/bloc/put_user/put_user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonUpdateUser extends StatelessWidget {
  ButtonUpdateUser({
    super.key,
    required this.controller,
    required this.user,
  });

  final ProfileController controller;
  final User user;
  final PutUserBloc putUserBloc = PutUserBloc(UserRepository());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocConsumer<PutUserBloc, PutUserState>(
          bloc: putUserBloc,
          listener: (context, state) {
            if (state is PutUserSuccess) {
              Flushbar(
                title: 'Login atualizado com sucesso',
                backgroundColor: Colors.green,
                flushbarPosition: FlushbarPosition.BOTTOM,
                message: 'Aprecia as funcionalidades do app',
                duration: const Duration(milliseconds: 1500),
              ).show(context);
            }
            if (state is PutUserFailure) {
              Flushbar(
                title: 'Erro ao atualizar',
                backgroundColor: Colors.red,
                flushbarPosition: FlushbarPosition.BOTTOM,
                message: 'Revise seus dados',
                duration: const Duration(seconds: 2),
              ).show(context);
            }
          },
          builder: (context, state) {
            if (state is PutUserProgress) {
              return InkWell(
                onTap: () {
                  var isValid = controller.validate();
                  if (isValid) {
                    putUserBloc.add(PutUserStarted(user: user));
                  }
                },
                child: const ButtonBorderPrimary(
                  paddingH: 30,
                  child: CircularProgressIndicator(color: Colors.lightBlue),
                ),
              );
            }
            return InkWell(
              onTap: () {
                print(user.name);
                var isValid = controller.validate();
                if (isValid) {
                  putUserBloc.add(PutUserStarted(user: user));
                }
              },
              child: const ButtonBorderPrimary(
                paddingH: 30,
                text: "Atualizar dados",
              ),
            );
          },
        ),
      ],
    );
  }
}
