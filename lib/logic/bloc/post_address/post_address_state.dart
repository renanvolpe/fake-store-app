part of 'post_address_bloc.dart';

@immutable
sealed class PostAddressState {}

final class PostAddressInitial extends PostAddressState {}
final class PostAddressProgress extends PostAddressState {}
final class PostAddressSuccess extends PostAddressState {
  final String message;
  PostAddressSuccess(this.message);
}
final class PostAddressFailure extends PostAddressState {
  final String message;
  PostAddressFailure(this.message);
}
