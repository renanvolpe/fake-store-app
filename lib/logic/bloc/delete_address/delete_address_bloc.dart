import 'package:bloc/bloc.dart';
import 'package:fake_store_joao/data/repositories/adresses_repository.dart';
import 'package:meta/meta.dart';

part 'delete_address_event.dart';
part 'delete_address_state.dart';

class DeleteAddressBloc extends Bloc<DeleteAddressEvent, DeleteAddressState> {
  DeleteAddressBloc(AddressesRepository repository) : super(DeleteAddressInitial()) {
    on<DeleteAddressStarted>((event, emit) async {
      emit(DeleteAddressProgress());
      var response = await repository.deleteAdddresses(event.id);
      response.fold((success) {
        //TODO USE CASE HERE
        emit(DeleteAddressSuccess("success"));
      }, (failure) => emit(DeleteAddressFailure(failure)));
    });
  }
}
