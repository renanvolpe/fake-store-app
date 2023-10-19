part of 'get_all_categories_bloc.dart';

@immutable
sealed class GetAllCategoriesEvent {}

class GetAllCategoriesStarted extends GetAllCategoriesEvent{}