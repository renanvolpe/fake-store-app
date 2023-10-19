import 'package:bloc/bloc.dart';
import 'package:fake_store_joao/data/models/profile.dart';
import 'package:fake_store_joao/data/repositories/authentication_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'get_user_event.dart';
part 'get_user_state.dart';

class GetUserBloc extends Bloc<GetUserEvent, GetUserState> {
  GetUserBloc(AuthenticationRepository authenticationRepository)
      : super(GetUserInitial()) {
    on<GetUserStarted>((event, emit) async {
      var response = await authenticationRepository.getProfile(event.token);
      response.fold((success) {
        //REGISTER SINGLETON PROFILE
        GetIt.instance.registerSingleton<Profile>(success);
        emit(GetUserSuccess());

      }, (failure) => GetUserFailure());
    });
  }
}
