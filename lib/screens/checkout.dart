import 'package:e_commerce_app/blocs/checkout/checkout_bloc.dart';
import 'package:e_commerce_app/screens/orderConfirmation.dart';
import 'package:e_commerce_app/screens/payment_selection.dart';
import 'package:e_commerce_app/widgets/navigation_button.dart';
import 'package:e_commerce_app/widgets/order_summary.dart';
import 'package:e_commerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TextEditingController emailController = TextEditingController();
    // TextEditingController nameController = TextEditingController();
    // TextEditingController addressController = TextEditingController();
    // TextEditingController cityController = TextEditingController();
    // TextEditingController countryController = TextEditingController();
    // TextEditingController zipcodeController = TextEditingController();
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Checkout',
        isWishlistPage: true,
        onBackPress: () {
          Navigator.pop(context);
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              if (state is CheckoutLoading) {
                return SizedBox();
              }
              if (state is CheckoutLoaded) {
                return NavigationButton(
                  title: 'ORDER NOW',
                  onPressed: () {
                    context.read<CheckoutBloc>().add(ConfirmCheckout(checkoutModel: state.checkoutModel));
                    Navigator.push(context, MaterialPageRoute(builder: (builder)=>OrderConfirmation()));
                  },
                );
              } else {
                return Text('Something went wrong');
              }
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            if (state is CheckoutLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CheckoutLoaded) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'CUSTOMER INFORMATION',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    buildTextField(
                      label: 'Email',
                      onChanged: (value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(email: value));
                      },
                    ),
                    buildTextField(
                      label: 'Full Name',
                      onChanged: (value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(name: value));
                      },
                    ),
                    SizedBox(height: 10),
                    const Text(
                      'DELIVERY INFORMATION',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    buildTextField(
                      label: 'Address',
                      onChanged: (value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(address: value));
                      },
                    ),
                    buildTextField(
                      label: 'City',
                      onChanged: (value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(city: value));
                      },
                    ),
                    buildTextField(
                      label: 'Country',
                      onChanged: (value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(country: value));
                      },
                    ),
                    buildTextField(
                      label: 'Zip Code',
                      onChanged: (value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(zipCode: value));
                      },
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (builder)=>PaymentSelection()));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('SELECT A PAYMENT METHOD'),
                              Icon(Icons.arrow_forward)
                            ],
                          )),
                    ),
                    SizedBox(height: 15),
                    const Text(
                      'ORDER SUMMARY',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const OrderSummary()
                  ],
                ),
              );
            } else {
              return const Center(
                child: Text('Something went wrong'),
              );
            }
          },
        ),
      ),
    );
  }

  buildTextField({required String label, Function(String)? onChanged}) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SizedBox(
        child: Row(
          children: [
            SizedBox(width: 75, child: Text(label)),
            Expanded(
              child: TextFormField(
                onChanged: onChanged,
                cursorColor: Colors.black,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    isDense: true,
                    focusColor: Colors.black,
                    focusedBorder: UnderlineInputBorder()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
