part of 'get_all_products_bloc.dart';

@immutable
sealed class GetAllProductsEvent {}

class GetAllProductsStarted extends GetAllProductsEvent {
  final int idCat;
  GetAllProductsStarted(this.idCat);
}
