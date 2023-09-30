import 'package:bloc/bloc.dart';
import 'package:fake_store_joao/data/repositories/authentication_repository.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(AuthenticationRepository authenticationRepository)
      : super(LoginInitial()) {
    on<LoginStarted>((event, emit) async {
      emit(LoginProgress());
      var response =
          await authenticationRepository.loginUser(event.email, event.password);
      response.fold(
          (success) => emit(LoginSuccess(success)), (failure) => emit(LoginFailure()));
    });
  }
}
