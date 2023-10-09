part of 'get_user_bloc.dart';

@immutable
sealed class GetUserState {}

final class GetUserInitial extends GetUserState {}
final class GetUserFailure extends GetUserState {}
final class GetUserSuccess extends GetUserState {}
final class GetUserProgress extends GetUserState {}
