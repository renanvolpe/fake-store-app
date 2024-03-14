part of 'address_select_cubit.dart';

@immutable
sealed class AddressSelectState {}

final class AddressSelectInitial extends AddressSelectState {}
final class AddressSelectSuccess extends AddressSelectState {}
final class AddressSelectEmpty extends AddressSelectState {}
