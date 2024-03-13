// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'post_address_bloc.dart';

@immutable
sealed class PostAddressEvent {}

class PostAddressStarted extends PostAddressEvent {
  final Address address;
  PostAddressStarted({
    required this.address,
  });
}
