part of 'create_user_bloc.dart';

@immutable
sealed class CreateUserEvent {}

class CreateUserStarted extends CreateUserEvent {
  final UserCreate userCreate;
  CreateUserStarted(this.userCreate);
}
