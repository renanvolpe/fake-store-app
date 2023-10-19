part of 'get_product_bloc.dart';

@immutable
sealed class GetProductState {}

final class GetProductInitial extends GetProductState {}

final class GetProductProgress extends GetProductState {}

final class GetProductSuccess extends GetProductState {
  final Product product;
  GetProductSuccess(this.product);
}

final class GetProductFailure extends GetProductState {}
