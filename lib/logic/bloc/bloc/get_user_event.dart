part of 'get_user_bloc.dart';

@immutable
sealed class GetUserEvent {}

class GetUserStarted extends GetUserEvent {
  final String token;
  GetUserStarted(this.token);
}
