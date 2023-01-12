import 'dart:io';

import 'package:e_commerce_app/blocs/payment/payment_bloc.dart';
import 'package:e_commerce_app/models/payment_model.dart';
import 'package:e_commerce_app/widgets/apple_pay.dart';
import 'package:e_commerce_app/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/widgets/google_pay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay/pay.dart';

import '../blocs/checkout/checkout_bloc.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Payment Selection',
        onBackPress: () {
          Navigator.pop(context);
        },
      ),
      body: BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          if (state is CheckoutLoading) {
            return const SizedBox();
          }
          if (state is CheckoutLoaded) {
            return BlocBuilder<PaymentBloc, PaymentState>(
              builder: (context, pState) {
                if(pState is PaymentLoading){
                  return const Center(child: CircularProgressIndicator());
                }
                if(pState is PaymentLoaded){
                  return ListView(
                    padding: EdgeInsets.all(20),
                    children: [
                      Platform.isIOS
                          ? ApplePayScreen(
                        total: state.total,
                        products: state.products,
                        onPressed: (){
                          context.read<PaymentBloc>().add(SelectPaymentMethod(paymentMethod: PaymentMethod.applePay));
                          Navigator.pop(context);
                        },
                      )
                          : SizedBox(),
                      GooglePayScreen(
                        total: state.total,
                        products: state.products,
                        onPressed: (){
                          context.read<PaymentBloc>().add(SelectPaymentMethod(paymentMethod: PaymentMethod.googlePay));
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<PaymentBloc>().add(SelectPaymentMethod(paymentMethod: PaymentMethod.creditCard));
                          Navigator.pop(context);
                            },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: StadiumBorder()),
                          child: const Text(
                            'Pay with Credit Card',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  );
                }else{
                  return const Center(
                    child: Text('Something went wrong'),
                  );
                }

              },
            );
          } else {
            return Text('Something went wrong');
          }
        },
      ),
    );
  }
}
