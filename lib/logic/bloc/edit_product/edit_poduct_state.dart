part of 'edit_poduct_bloc.dart';

@immutable
sealed class EditPoductState {}

final class EditPoductInitial extends EditPoductState {}
final class EditPoductProgress extends EditPoductState {}
final class EditPoductSuccess extends EditPoductState {}
final class EditPoductFailure extends EditPoductState {}
