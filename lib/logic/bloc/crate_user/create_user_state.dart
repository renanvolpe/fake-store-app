part of 'create_user_bloc.dart';

@immutable
sealed class CreateUserState {}

final class CreateUserInitial extends CreateUserState {}

final class CreateUserProgress extends CreateUserState {}

final class CreateUserSuccess extends CreateUserState {}

final class CreateUserFailure extends CreateUserState {
  final String errorMessage;
  CreateUserFailure(this.errorMessage);
}
