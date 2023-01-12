part of 'checkout_bloc.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();
  @override
  List<Object?> get props => [];
}

class CheckoutLoading extends CheckoutState {
  @override
  List<Object?> get props => [];
}

class CheckoutLoaded extends CheckoutState {
  final String? name;
  final String? email;
  final String? address;
  final String? city;
  final String? country;
  final String? zipCode;
  final List<ProductModel>? products;
  final String? deliveryFee;
  final String? subTotal;
  final String? total;
  final CheckoutModel checkoutModel;
  final PaymentMethod paymentMethod;

   CheckoutLoaded({
    this.name,
    this.email,
    this.address,
    this.city,
    this.country,
    this.zipCode,
    this.products,
    this.deliveryFee,
    this.subTotal,
    this.total,
     this.paymentMethod = PaymentMethod.googlePay
  }) : checkoutModel = CheckoutModel(name: name,
    email: email,
    address: address,
    city: city,
    country: country,
    zipCode: zipCode,
    products: products,
    deliveryFee: deliveryFee,
    subTotal: subTotal,
    total: total,);

  @override
  List<Object?> get props => [
    name,
    email,
    address,
    city,
    country,
    zipCode,
    products,
    deliveryFee,
    subTotal,
    total,
    paymentMethod,
  ];

}
