part of 'put_user_bloc.dart';

@immutable
sealed class PutUserState {}

final class PutUserInitial extends PutUserState {}
final class PutUserProgress extends PutUserState {}
final class PutUserSuccess extends PutUserState {
  final User user;
  PutUserSuccess(this.user);
}
final class PutUserFailure extends PutUserState {
  final String message;
  PutUserFailure(this.message);
}
