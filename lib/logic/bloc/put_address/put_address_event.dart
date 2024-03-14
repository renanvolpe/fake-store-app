// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'put_address_bloc.dart';

@immutable
sealed class PutAddressEvent {}
class PutAddressStarted extends PutAddressEvent {
final Address address;
  PutAddressStarted({
    required this.address,
  });
  
}
