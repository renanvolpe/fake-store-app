part of 'get_product_bloc.dart';

@immutable
sealed class GetProductEvent {}

class GetProductStarted extends GetProductEvent {
  final int idProd;
  GetProductStarted(this.idProd);
}
