import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

import '../models/product_model.dart';

class GooglePayScreen extends StatelessWidget {
  final String? total;
  final List<ProductModel>? products;
  final void Function()? onPressed;

  const GooglePayScreen({Key? key, this.products, this.total, this.onPressed})
      : super(key: key);

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
    return GooglePayButton(
      paymentConfigurationAsset: 'google_pay.json',
      onPaymentResult: onGooglePayResult,
      paymentItems: _paymentItems!,
      type: GooglePayButtonType.pay,
      onPressed: onPressed,
    );
  }
}
