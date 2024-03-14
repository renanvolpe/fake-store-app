part of 'put_address_bloc.dart';

@immutable
sealed class PutAddressState {}

final class PutAddressInitial extends PutAddressState {}

final class PutAddressProgress extends PutAddressState {}

final class PutAddressSuccess extends PutAddressState {
  final String message;
  PutAddressSuccess(this.message);
}

final class PutAddressFailure extends PutAddressState {
  final String message;
  PutAddressFailure(this.message);
}
