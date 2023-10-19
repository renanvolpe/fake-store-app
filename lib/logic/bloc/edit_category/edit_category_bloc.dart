import 'package:bloc/bloc.dart';
import 'package:fake_store_joao/data/models/category.dart';
import 'package:fake_store_joao/data/repositories/categories_repository.dart';
import 'package:meta/meta.dart';

part 'edit_category_event.dart';
part 'edit_category_state.dart';

class EditCategoryBloc extends Bloc<EditCategoryEvent, EditCategoryState> {
  EditCategoryBloc(CateogriesRepository cateogriesRepository)
      : super(EditCategoryInitial()) {
    on<EditCategoryStarted>((event, emit) async {
      emit(EditCategoryProgress());
      var newCategory = Category(
          id: event.category.id,
          name: event.category.name,
          image: event.category.image,
          creationAt: event.category.creationAt,
          updatedAt: event.category.updatedAt);
      var response = await cateogriesRepository.updateCategory(newCategory);
      response.fold((success) => emit(EditCategorySuccess()),
          (failure) => emit(EditCategoryFailure()));
    });
  }
}
