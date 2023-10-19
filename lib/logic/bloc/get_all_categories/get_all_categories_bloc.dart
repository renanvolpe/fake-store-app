import 'package:bloc/bloc.dart';
import 'package:fake_store_joao/data/repositories/categories_repository.dart';
import 'package:fake_store_joao/data/models/category.dart' as cat;
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'get_all_categories_event.dart';
part 'get_all_categories_state.dart';

class GetAllCategoriesBloc
    extends Bloc<GetAllCategoriesEvent, GetAllCategoriesState> {
  GetAllCategoriesBloc(CateogriesRepository cateogriesRepository)
      : super(GetAllCategoriesInitial()) {
    on<GetAllCategoriesStarted>((event, emit) async {
      emit(GetAllCategoriesProgress());
      var response = await cateogriesRepository.getAllCategories();
      response.fold((success) => emit(GetAllCategoriesSuccess(success)),
          (failure) => emit(GetAllCategoriesFailure()));
    });
  }
}
