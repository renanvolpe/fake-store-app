import 'package:bloc/bloc.dart';
import 'package:fake_store_joao/data/models/profile/profile.dart';
import 'package:fake_store_joao/data/repositories/authentication_repository.dart';
import 'package:fake_store_joao/logic/get_it/init_get_it.dart';
import 'package:meta/meta.dart';

part 'get_user_event.dart';
part 'get_user_state.dart';

class GetUserBloc extends Bloc<GetUserEvent, GetUserState> {
  GetUserBloc(AuthenticationRepository authenticationRepository) : super(GetUserInitial()) {
    on<GetUserStarted>((event, emit) async {
      var response = await authenticationRepository.getProfile(event.token);

      response.fold((success) {
        //USE CASE HERE

        SetupBinds.setupBindsHome(Profile(token: event.token, user: success));

        emit(GetUserSuccess());
      }, (failure) => GetUserFailure());
    });
  }
}
