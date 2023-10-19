part of 'edit_category_bloc.dart';

@immutable
sealed class EditCategoryEvent {}

class EditCategoryStarted extends EditCategoryEvent {
  final Category category;
  EditCategoryStarted(this.category );
}
