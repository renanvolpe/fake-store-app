import 'package:bloc/bloc.dart';
import 'package:fake_store_joao/data/models/product.dart';
import 'package:fake_store_joao/data/repositories/products_repository.dart';
import 'package:meta/meta.dart';

part 'get_all_products_event.dart';
part 'get_all_products_state.dart';

class GetAllProductsBloc
    extends Bloc<GetAllProductsEvent, GetAllProductsState> {
  GetAllProductsBloc(ProductRepository productRepository)
      : super(GetAllProductsInitial()) {
    on<GetAllProductsStarted>((event, emit) async {
      emit(GetAllProductsProgress());
      var response = await productRepository.getAllProducts(event.idCat);
      response.fold((success) => emit(GetAllProductsSuccess(success)),
          (failure) => emit(GetAllProductsFailure()));
    });
  }
}
