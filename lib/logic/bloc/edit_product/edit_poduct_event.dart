part of 'edit_poduct_bloc.dart';

@immutable
sealed class EditPoductEvent {}

class EditProductStarted extends EditPoductEvent {
  final Product product;
  EditProductStarted(this.product);
}
