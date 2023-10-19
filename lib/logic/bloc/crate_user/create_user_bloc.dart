import 'package:bloc/bloc.dart';
import 'package:fake_store_joao/data/models/user_create.dart';
import 'package:fake_store_joao/data/repositories/users_repository.dart';
import 'package:meta/meta.dart';

part 'create_user_event.dart';
part 'create_user_state.dart';

class CreateUserBloc extends Bloc<CreateUserEvent, CreateUserState> {
  CreateUserBloc(UserRepository userRepository) : super(CreateUserInitial()) {
    on<CreateUserStarted>((event, emit) async {
      emit(CreateUserProgress());
      var response = await userRepository.createUser(event.userCreate);
      response.fold((success) => emit(CreateUserSuccess()),
          (failure) => emit(CreateUserFailure(failure)));
    });
  }
}
