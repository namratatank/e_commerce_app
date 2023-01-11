import 'package:e_commerce_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

class PaymentSelection extends StatefulWidget {
  const PaymentSelection({Key? key}) : super(key: key);

  @override
  State<PaymentSelection> createState() => _PaymentSelectionState();
}

class _PaymentSelectionState extends State<PaymentSelection> {
  void onGooglePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }

  void onApplePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }

  static const _paymentItems = [
    PaymentItem(
      label: 'Total',
      amount: '99.99',
      status: PaymentItemStatus.final_price,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Payment Selection',
        onBackPress: () {
          Navigator.pop(context);
        },
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          ApplePayButton(
            paymentConfigurationAsset: 'apple_pay.json',
            onPaymentResult: onApplePayResult,
            paymentItems: _paymentItems,
            type: ApplePayButtonType.buy,
          ),
          GooglePayButton(
              paymentConfigurationAsset: 'google_pay.json',
              onPaymentResult: onGooglePayResult,
              paymentItems: _paymentItems,
            type: GooglePayButtonType.buy,
            loadingIndicator: const Center(
              child: CircularProgressIndicator(),
            ),
          ),

        ],
      ),
    );
  }
}
