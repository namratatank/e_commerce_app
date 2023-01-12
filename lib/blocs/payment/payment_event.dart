part of 'payment_bloc.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();
  @override
  List<Object> get props => [];
}

class LoadPaymentMethod extends PaymentEvent{
  @override
  List<Object> get props => [];
}

class SelectPaymentMethod extends PaymentEvent{
  final PaymentMethod paymentMethod;
  SelectPaymentMethod({required this.paymentMethod});
  @override
  List<Object> get props => [paymentMethod];
}


