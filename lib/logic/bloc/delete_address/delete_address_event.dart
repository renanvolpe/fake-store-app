// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'delete_address_bloc.dart';

@immutable
sealed class DeleteAddressEvent {}

class DeleteAddressStarted extends DeleteAddressEvent {
  final int id;
  DeleteAddressStarted({
    required this.id,
  });
  
}
