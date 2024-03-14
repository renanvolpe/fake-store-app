import 'package:bloc/bloc.dart';
import 'package:fake_store_joao/data/models/address.dart';
import 'package:fake_store_joao/data/repositories/adresses_repository.dart';
import 'package:meta/meta.dart';

part 'get_list_addres_event.dart';
part 'get_list_addres_state.dart';

class GetListAddressBloc extends Bloc<GetListAddressEvent, GetListAddressState> {
  GetListAddressBloc(AddressesRepository addressesRepository)
      : super(GetListAddressInitial()) {
    on<GetListAddressStarted>((event, emit) async {
      emit(GetListAddressProgress());
      var response = await addressesRepository.getListAddresses();
     response.fold((success) {
        //TODO USE CASE HERE
        emit(GetListAddressSuccess(success));
      }, (failure) => emit(GetListAddressFailure(failure)));
    });
  }
}
