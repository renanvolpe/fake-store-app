import 'package:fake_store_joao/core/default/button_default.dart';
import 'package:fake_store_joao/core/default/circular_progress_indicator.dart';
import 'package:fake_store_joao/data/models/profile/profile_controller.dart';
import 'package:fake_store_joao/data/models/profile/user/user.dart';
import 'package:fake_store_joao/logic/bloc/put_user/put_user_bloc.dart';
import 'package:fake_store_joao/logic/get_it/init_get_it.dart';
import 'package:fake_store_joao/presentation/commum_widgets/app_flushbars.dart';
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
  final PutUserBloc putUserBloc = binds.get<PutUserBloc>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocConsumer<PutUserBloc, PutUserState>(
          bloc: putUserBloc,
          listener: (context, state) {
            if (state is PutUserSuccess) {
              flushbarSuccess(context, "Profile Updated", 'Test other features in this app');
            }
            if (state is PutUserFailure) {
              flushbarError(context, 'Error on update', 'Review your data');
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
                  child: CircularProgressIndicatorDefault(isLight: true),
                ),
              );
            }
            return InkWell(
              onTap: () {
                var isValid = controller.validate();
                if (isValid) {
                  putUserBloc.add(PutUserStarted(user: user));
                }
              },
              child: const ButtonBorderPrimary(
                paddingH: 30,
                text: "Update here",
              ),
            );
          },
        ),
      ],
    );
  }
}
