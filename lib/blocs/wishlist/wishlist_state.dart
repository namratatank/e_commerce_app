part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object?> get props => [];
}

class WishlistLoading extends WishlistState {}

class WishlistLoaded extends WishlistState {
  final WishListModel wishListModel;

  const WishlistLoaded({required this.wishListModel});

  @override
  List<Object?> get props => [wishListModel];
}

class WishlistError extends WishlistState {}
