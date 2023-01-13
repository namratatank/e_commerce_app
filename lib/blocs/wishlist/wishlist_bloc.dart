import 'package:e_commerce_app/models/wishlist_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../localstorage/local_storage_repository.dart';
import '../../models/product_model.dart';

part 'wishlist_event.dart';

part 'wishlist_state.dart';

class WishListBloc extends Bloc<WishListEvent, WishlistState> {
  final LocalStorageRepository _localStorageRepository;

  WishListBloc({required LocalStorageRepository localStorageRepository})
      : _localStorageRepository = localStorageRepository,
        super(WishlistLoading()) {
    on<StartWishlist>(_onStartWishlist);
    on<AddProductToWishlist>(_onAddProductToWishlist);
    on<RemoveProductFromWishlist>(_onRemoveProductFromWishlist);
  }

  void _onStartWishlist(
      StartWishlist event, Emitter<WishlistState> emit) async {
    emit(WishlistLoading());
    try {
      Box box = await _localStorageRepository.openBox();
      List<ProductModel> products = _localStorageRepository.getWishlist(box);
      await Future.delayed(Duration(seconds: 1));
      emit(
        WishlistLoaded(
          wishListModel: WishListModel(products: products),
        ),
      );
    } catch (_) {
      emit(WishlistError());
    }
  }

  void _onAddProductToWishlist(
      AddProductToWishlist event, Emitter<WishlistState> emit) async {
    if (state is WishlistLoaded) {
      try {
        Box box = await _localStorageRepository.openBox();
        _localStorageRepository.addProductToWishlist(box, event.product!);
        emit(
          WishlistLoaded(
            wishListModel: WishListModel(
                products:
                    List.from((state as WishlistLoaded).wishListModel.products)
                      ..add(event.product!)),
          ),
        );
      } on Exception {
        emit(WishlistError());
      }
    }
  }

  void _onRemoveProductFromWishlist(
      RemoveProductFromWishlist event, Emitter<WishlistState> emit) async {
    if (state is WishlistLoaded) {
      try {
        Box box = await _localStorageRepository.openBox();
        _localStorageRepository.removeProductFromWishlist(box, event.product!);
        emit(
          WishlistLoaded(
            wishListModel: WishListModel(
                products:
                    List.from((state as WishlistLoaded).wishListModel.products)
                      ..remove(event.product!)),
          ),
        );
      } on Exception {
        emit(WishlistError());
      }
    }
  }

// @override
// Stream<WishlistState> mapEventToState(WishListEvent event) async* {
//   if (event is StartWishlistProduct) {
//     yield* _mapStartWishListToState();
//   } else if (event is AddWishlistProduct) {
//     yield* _mapAddWishListToState(event, state);
//   } else if (event is RemoveWishlistProduct) {
//     yield* _mapRemoveWishListToState(event, state);
//   }
// }
//
// Stream<WishlistState> _mapStartWishListToState() async* {
//   yield WishlistLoading();
//   try {
//     await Future<void>.delayed(Duration(seconds: 1));
//     yield const WishlistLoaded();
//   } catch (_) {}
// }
//
// Stream<WishlistState> _mapAddWishListToState(AddWishlistProduct event,
//     WishlistState state) async* {
//   if (state is WishlistLoaded) {
//     try {
//       yield WishlistLoaded(wishListModel: WishListModel(
//           products: List.from(state.wishListModel.products)
//             ..add(event.products!)));
//     } catch (_) {}
//   }
// }
//
// Stream<WishlistState> _mapRemoveWishListToState(RemoveWishlistProduct event,
//     WishlistState state) async* {
//   if (state is WishlistLoaded) {
//     try {
//       yield WishlistLoaded(wishListModel: WishListModel(
//           products: List.from(state.wishListModel.products)
//             ..remove(event.products!)));
//     } catch (_) {}
//   }
// }

}
