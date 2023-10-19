part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginStarted extends LoginEvent {
  final String email;
  final String password;
  LoginStarted(this.email, this.password);
}
