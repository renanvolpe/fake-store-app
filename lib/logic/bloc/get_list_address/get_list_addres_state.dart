part of 'get_list_addres_bloc.dart';

@immutable
sealed class GetListAddressState {}

final class GetListAddressInitial extends GetListAddressState {}
final class GetListAddressProgress extends GetListAddressState {}
final class GetListAddressSuccess extends GetListAddressState {
  final List<Address> listAddresses;
  GetListAddressSuccess(this.listAddresses);
}
final class GetListAddressFailure extends GetListAddressState {
  final String message;
  GetListAddressFailure(this.message);
}
