part of 'wishlist_bloc.dart';

@immutable
abstract class WishListEvent extends Equatable {
  const WishListEvent();

  @override
  List<Object?> get props => [];
}

class StartWishlist extends WishListEvent {
  @override
  List<Object?> get props => [];
}

class AddProductToWishlist extends WishListEvent {
  final ProductModel? product;

  const AddProductToWishlist({this.product});

  @override
  List<Object?> get props => [product];
}

class RemoveProductFromWishlist extends WishListEvent {
  final ProductModel? product;

  const RemoveProductFromWishlist({this.product});

  @override
  List<Object?> get props => [product];
}
