part of 'delete_address_bloc.dart';

@immutable
sealed class DeleteAddressState {}

final class DeleteAddressInitial extends DeleteAddressState {}
final class DeleteAddressProgress extends DeleteAddressState {}
final class DeleteAddressSuccess extends DeleteAddressState {
  final String message;
  DeleteAddressSuccess(this.message);
}
final class DeleteAddressFailure extends DeleteAddressState {
  final String message;
  DeleteAddressFailure(this.message);
}
