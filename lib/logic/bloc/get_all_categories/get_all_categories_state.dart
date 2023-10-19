part of 'get_all_categories_bloc.dart';

@immutable
sealed class GetAllCategoriesState {}

final class GetAllCategoriesInitial extends GetAllCategoriesState {}

final class GetAllCategoriesProgress extends GetAllCategoriesState {}

final class GetAllCategoriesSuccess extends GetAllCategoriesState {
  final List<cat.Category> category;
  GetAllCategoriesSuccess(this.category);
}

final class GetAllCategoriesFailure extends GetAllCategoriesState {}
