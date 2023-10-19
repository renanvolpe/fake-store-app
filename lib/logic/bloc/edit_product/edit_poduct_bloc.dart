import 'package:bloc/bloc.dart';
import 'package:fake_store_joao/data/models/product.dart';
import 'package:fake_store_joao/data/repositories/products_repository.dart';
import 'package:meta/meta.dart';

part 'edit_poduct_event.dart';
part 'edit_poduct_state.dart';

class EditPoductBloc extends Bloc<EditPoductEvent, EditPoductState> {
  EditPoductBloc(ProductRepository productRepository)
      : super(EditPoductInitial()) {
    on<EditProductStarted>((event, emit) async {
      emit(EditPoductProgress());
      var response = await productRepository.updateProduct(event.product);
      response.fold((success) => emit(EditPoductSuccess()),
          (failure) => emit(EditPoductFailure()));
    });
  }
}
