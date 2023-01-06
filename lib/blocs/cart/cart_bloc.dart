import 'package:e_commerce_app/models/cart_model.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<CartStarted>(_onStartCart);
    on<AddProductToCart>(_onAddProductToCart);
    on<RemoveProductFromCart>(_onRemoveProductFromCart);
  }

  void _onStartCart(CartStarted event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      await Future.delayed(Duration(seconds: 1));
      emit(const CartLoaded());
    } catch (_) {
      emit(CartError());
    }
  }

  void _onAddProductToCart(
      AddProductToCart event, Emitter<CartState> emit) async {
    if (state is CartLoaded) {
      try {
        emit(CartLoaded(
            cartModel: CartModel(
                products: List.from((state as CartLoaded).cartModel.products)
                  ..add(event.product))));
      } catch (_) {
        emit(CartError());
      }
    }
  }

  void _onRemoveProductFromCart(
      RemoveProductFromCart event, Emitter<CartState> emit) async {
    if (state is CartLoaded) {
      try {
        emit(CartLoaded(
            cartModel: CartModel(
                products: List.from((state as CartLoaded).cartModel.products)
                  ..remove(event.product))));
      } catch (_) {
        emit(CartError());
      }
    }
  }

// Stream<CartState> mapEventToState(CartEvent event) async* {
//   if (event is CartStarted) {
//     yield* _mapCartStartedToState();
//   } else if (event is CartProductAdded) {
//     yield* _mapCartProductAddedToState(event, state);
//   } else if (event is CartProductRemoved) {
//     yield* _mapCartProductRemovedToState(event, state);
//   }
// }
//
// Stream<CartState> _mapCartStartedToState() async* {
//   yield CartLoading();
//   try {
//     await Future<void>.delayed(Duration(seconds: 1));
//     yield CartLoaded();
//   } catch (_) {}
// }
//
// Stream<CartState> _mapCartProductAddedToState(CartProductAdded event,
//     CartState state) async* {
//   if (state is CartLoaded) {
//     try {
//       yield CartLoaded(cartModel: CartModel(
//           products: List.from(state.cartModel.products)
//             ..add(event.product)));
//     } catch (_) {}
//   }
// }
//
// Stream<CartState> _mapCartProductRemovedToState(CartProductRemoved event,
//     CartState state) async* {
//   if (state is CartLoaded) {
//     try {
//       yield CartLoaded(cartModel: CartModel(
//           products: List.from(state.cartModel.products)
//             ..remove(event.product)));
//     } catch (_) {}
//   }
// }

}
