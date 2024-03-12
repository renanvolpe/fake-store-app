// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'put_user_bloc.dart';

@immutable
sealed class PutUserEvent {}

class PutUserStarted extends PutUserEvent {
  final User user;
  PutUserStarted({
    required this.user,
  });
}
