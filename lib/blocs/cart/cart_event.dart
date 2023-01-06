part of 'cart_bloc.dart';

class CartEvent extends Equatable{

  @override
  List<Object?> get props => [];

}

class CartStarted extends CartEvent{

  @override
  List<Object?> get props => [];
}

class AddProductToCart extends CartEvent{
  final ProductModel product;
  AddProductToCart({required this.product});
  @override
  List<Object?> get props => [product];
}

class RemoveProductFromCart extends CartEvent{
  final ProductModel product;
  RemoveProductFromCart({required this.product});
  @override
  List<Object?> get props => [product];
}