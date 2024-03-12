import 'package:bloc/bloc.dart';
import 'package:fake_store_joao/data/models/product.dart';
import 'package:fake_store_joao/data/repositories/products_repository.dart';
import 'package:meta/meta.dart';

part 'get_all_products_event.dart';
part 'get_all_products_state.dart';

class GetAllProductsBloc extends Bloc<GetAllProductsEvent, GetAllProductsState> {
  GetAllProductsBloc(ProductRepository productRepository) : super(GetAllProductsInitial()) {
    on<GetAllProductsStarted>((event, emit) async {
      emit(GetAllProductsProgress());
      var response = await productRepository.getAllProducts(event.idCat);
      response.fold((success) {
        //USE CASE HERE

        success = _checkListProducts(success, event.idCat);
        if (success.isEmpty) {
          emit(GetAllProductsFailure());
        } else {
          emit(GetAllProductsSuccess(success));
        }
      }, (failure) => emit(GetAllProductsFailure()));
    });
  }
  List<Product> _checkListProducts(List<Product> listProd, int? idCat) {
    //if idCat is not null, it is searching bt categories, so show this values
    if (idCat != null) {
      return listProd;
    }

    //if there is < 4 images, it shows error
    if (listProd.length < 4) {
      return [];
    }

    //reverse list to get lastets prods registered
    listProd = listProd.reversed.toList();

    int numImagesInHome = 9;
    List<Product> newListProd = [];

    //get 0 values to this list
    for (var element in listProd) {
      if (element.images.isNotEmpty) {
        newListProd.add(element);
        if (newListProd.length > numImagesInHome) {
          return newListProd;
        }
      }
    }

    return newListProd;
  }
}
