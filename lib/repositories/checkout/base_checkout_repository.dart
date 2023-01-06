import '../../models/checkout_model.dart';

abstract class BaseCheckRepository{
  Future<void> addCheckout(CheckoutModel checkoutModel);
}