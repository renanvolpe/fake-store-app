import 'package:bloc/bloc.dart';
import 'package:fake_store_joao/data/models/address.dart';
import 'package:fake_store_joao/data/repositories/adresses_repository.dart';
import 'package:meta/meta.dart';

part 'put_address_event.dart';
part 'put_address_state.dart';

class PutAddressBloc extends Bloc<PutAddressEvent, PutAddressState> {
  PutAddressBloc(AddressesRepository addressesRepository) : super(PutAddressInitial()) {
    on<PutAddressStarted>((event, emit) async {
      emit(PutAddressProgress());
      var response = await addressesRepository.putAddresses(event.address);
      response.fold((success) {
        //TODO USE CASE HERE
        emit(PutAddressSuccess("success"));
      }, (failure) => emit(PutAddressFailure(failure)));
    });
  }
}
