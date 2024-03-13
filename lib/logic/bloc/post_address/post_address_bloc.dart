import 'package:bloc/bloc.dart';
import 'package:fake_store_joao/data/models/address.dart';
import 'package:fake_store_joao/data/repositories/adresses_repository.dart';
import 'package:meta/meta.dart';

part 'post_address_event.dart';
part 'post_address_state.dart';

class PostAddressBloc extends Bloc<PostAddressEvent, PostAddressState> {
  PostAddressBloc(AddressesRepository addressesRepository)
      : super(PostAddressInitial()) {
    on<PostAddressStarted>((event, emit) async {
      emit(PostAddressProgress());
      var response = await addressesRepository.postAddresses(event.address);
     response.fold((success) {
        //TODO USE CASE HERE
        emit(PostAddressSuccess("success"));
      }, (failure) => emit(PostAddressFailure(failure)));
    });
  }
}
