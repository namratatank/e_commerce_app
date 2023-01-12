import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

import '../models/product_model.dart';

class ApplePayScreen extends StatelessWidget {
  final String? total;
  final List<ProductModel>? products;
  final void Function()? onPressed;

  const ApplePayScreen({Key? key, this.products, this.total, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onGooglePayResult(paymentResult) {
      debugPrint(paymentResult.toString());
    }

    final _paymentItems = products
        ?.map(
          (product) => PaymentItem(
        amount: product.price.toString(),
        label: product.name,
        type: PaymentItemType.item,
        status: PaymentItemStatus.final_price,
      ),
    )
        .toList();
    _paymentItems?.add(PaymentItem(
      amount: total.toString(),
      label: 'Total',
      type: PaymentItemType.total,
      status: PaymentItemStatus.final_price,
    ));
    return ApplePayButton(
      paymentConfigurationAsset: 'assets/apple_pay.json',
      onPaymentResult: onGooglePayResult,
      paymentItems: _paymentItems!,
      style: ApplePayButtonStyle.black,
      type: ApplePayButtonType.inStore,
      loadingIndicator: Center(child: CircularProgressIndicator(),),
      onPressed: onPressed,
    );
  }
}
