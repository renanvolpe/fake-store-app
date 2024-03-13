import 'package:bloc/bloc.dart';
import 'package:fake_store_joao/data/models/address.dart';
import 'package:meta/meta.dart';

part 'address_select_state.dart';

class AddressSelectCubit extends Cubit<Address?> {
  AddressSelectCubit() : super(null);

  void select(Address newAddress) => emit(newAddress);
}
