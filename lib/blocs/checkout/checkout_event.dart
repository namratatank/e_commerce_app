part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object?> get props => [];
}

class UpdateCheckout extends CheckoutEvent {
  final String? name;
  final String? email;
  final String? address;
  final String? city;
  final String? country;
  final String? zipCode;
  final CartModel? cartModel;

  const UpdateCheckout({
    this.name,
    this.email,
    this.address,
    this.city,
    this.country,
    this.zipCode,
    this.cartModel,
  });

  @override
  List<Object?> get props => [
    name,
    email,
    address,
    city,
    country,
    zipCode,
  ];
}

class ConfirmCheckout extends CheckoutEvent {
  final CheckoutModel checkoutModel;
  const ConfirmCheckout({required this.checkoutModel});
  @override
  List<Object?> get props => [checkoutModel];
}
