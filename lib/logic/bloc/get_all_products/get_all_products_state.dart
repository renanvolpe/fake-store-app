part of 'get_all_products_bloc.dart';

@immutable
sealed class GetAllProductsState {}

final class GetAllProductsInitial extends GetAllProductsState {}

final class GetAllProductsProgress extends GetAllProductsState {}

final class GetAllProductsSuccess extends GetAllProductsState {
  final List<Product> listProducts;
  GetAllProductsSuccess(this.listProducts);
}

final class GetAllProductsFailure extends GetAllProductsState {}
