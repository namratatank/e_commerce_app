part of 'payment_bloc.dart';

abstract class PaymentState extends Equatable {
  const PaymentState();
  @override
  List<Object> get props => [];
}

class PaymentLoading extends PaymentState {
  @override
  List<Object> get props => [];
}

class PaymentLoaded extends PaymentState {
  final PaymentMethod paymentMethod;
  PaymentLoaded({this.paymentMethod = PaymentMethod.googlePay});
  @override
  List<Object> get props => [paymentMethod];
}

