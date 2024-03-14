import 'package:bloc/bloc.dart';
import 'package:fake_store_joao/data/models/profile/user/user.dart';
import 'package:fake_store_joao/data/repositories/users_repository.dart';
import 'package:meta/meta.dart';

part 'put_user_event.dart';
part 'put_user_state.dart';

class PutUserBloc extends Bloc<PutUserEvent, PutUserState> {
  PutUserBloc(UserRepository userRepository) : super(PutUserInitial()) {
    on<PutUserStarted>((event, emit) async {
      emit(PutUserProgress());
      var response = await userRepository.updateUser(event.user);
      response.fold((success) {
        //TODO USE CASE HERE
        emit(PutUserSuccess(success));
      }, (failure) => emit(PutUserFailure(failure)));
    });
  }
}
