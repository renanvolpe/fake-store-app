import 'package:bloc/bloc.dart';
import 'package:fake_store_joao/data/models/product.dart';
import 'package:fake_store_joao/data/repositories/products_repository.dart';
import 'package:meta/meta.dart';

part 'get_product_event.dart';
part 'get_product_state.dart';

class GetProductBloc extends Bloc<GetProductEvent, GetProductState> {
  GetProductBloc(ProductRepository productRepository)
      : super(GetProductInitial()) {
    on<GetProductStarted>((event, emit) async {
      emit(GetProductProgress());
      var response = await productRepository.getOneProduct(event.idProd);
      response.fold((success) => emit(GetProductSuccess(success)),
          (failure) => emit(GetProductFailure()));
    });
  }
}
