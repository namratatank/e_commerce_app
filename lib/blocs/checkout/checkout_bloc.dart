import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/blocs/payment/payment_bloc.dart';
import 'package:e_commerce_app/models/cart_model.dart';
import 'package:e_commerce_app/models/checkout_model.dart';
import 'package:equatable/equatable.dart';

import '../../models/payment_model.dart';
import '../../models/product_model.dart';
import '../../repositories/checkout/checkout_repository.dart';
import '../cart/cart_bloc.dart';

part 'checkout_event.dart';

part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CartBloc _cartBloc;
  final PaymentBloc _paymentBloc;
  final CheckoutRepository _checkoutRepository;
  StreamSubscription? _cartSubscription;
  StreamSubscription? _paymentSubscription;
  StreamSubscription? _checkoutSubscription;

  CheckoutBloc(
      {required CartBloc cartBloc,
        required PaymentBloc paymentBloc,
      required CheckoutRepository checkoutRepository})
      : _cartBloc = cartBloc,
        _paymentBloc = paymentBloc,
        _checkoutRepository = checkoutRepository,
        super(cartBloc.state is CartLoaded
            ? CheckoutLoaded(
                products: (cartBloc.state as CartLoaded).cartModel.products,
                subTotal:
                    (cartBloc.state as CartLoaded).cartModel.subTotalString,
                deliveryFee:
                    (cartBloc.state as CartLoaded).cartModel.deliveryFeeString,
                total: (cartBloc.state as CartLoaded).cartModel.totalString,
              )
            : CheckoutLoading()) {
    on<UpdateCheckout>(_onUpdateCheckout);
    on<ConfirmCheckout>(_onConfirmCheckout);
    _cartSubscription = _cartBloc.stream.listen((state) {
      if (state is CartLoaded) {
        add(UpdateCheckout(cartModel: state.cartModel));
      }
    });

    _paymentSubscription = _paymentBloc.stream.listen((state) {
      if (state is PaymentLoaded) {
        add(UpdateCheckout(paymentMethod: state.paymentMethod));
      }
    });
  }

  void _onUpdateCheckout(UpdateCheckout event, Emitter<CheckoutState> emit) {
    if (state is CheckoutLoaded) {
      final state = this.state as CheckoutLoaded;
      emit(
        CheckoutLoaded(
          email: event.email ?? state.email,
          name: event.name ?? state.name,
          products: event.cartModel?.products ?? state.products,
          deliveryFee: event.cartModel?.deliveryFeeString ?? state.deliveryFee,
          subTotal: event.cartModel?.subTotalString ?? state.subTotal,
          total: event.cartModel?.totalString ?? state.total,
          address: event.address ?? state.address,
          city: event.city ?? state.city,
          country: event.country ?? state.country,
          zipCode: event.zipCode ?? state.zipCode,
          paymentMethod: event.paymentMethod??state.paymentMethod,
        ),
      );
    }
  }

  void _onConfirmCheckout(ConfirmCheckout event, Emitter<CheckoutState> emit) async{
    _checkoutSubscription?.cancel();
    if(state is CheckoutLoaded){
      try{
        await _checkoutRepository.addCheckout(event.checkoutModel);
        print('Done');
        emit(CheckoutLoading());
      }catch(_){}
    }
  }
  @override
  Future<void> close() {
    _cartSubscription?.cancel();
    _paymentSubscription?.cancel();
    return super.close();
  }
}
