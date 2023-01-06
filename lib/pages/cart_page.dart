import 'package:e_commerce_app/blocs/cart/cart_bloc.dart';
import 'package:e_commerce_app/pages/dashboard.dart';
import 'package:e_commerce_app/screens/checkout.dart';
import 'package:e_commerce_app/widgets/navigation_button.dart';
import 'package:e_commerce_app/widgets/order_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/cart_product_card.dart';
import '../widgets/custom_app_bar.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Cart',
        isBackArrow: false,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: NavigationButton(
                title: 'GO TO CHECK OUT',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => CheckoutScreen()));
                })),
      ),
      body: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
        if (state is CartLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CartLoaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(state.cartModel.freeDeliveryString),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (builder) => Dashboard()));
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black),
                            child: const Text(
                              'Add more items',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: ListView.builder(
                            itemCount: state.cartModel
                                .productQuantity(state.cartModel.products)
                                .keys
                                .length,
                            itemBuilder: (context, index) {
                              return CartProductCard(
                                productModel: state.cartModel
                                    .productQuantity(state.cartModel.products)
                                    .keys
                                    .elementAt(index),
                                quantity: state.cartModel
                                    .productQuantity(state.cartModel.products)
                                    .values
                                    .elementAt(index),
                              );
                            }),
                      ),
                    ],
                  ),
                  Column(
                    children: [OrderSummary()],
                  )
                ],
              ),
            ),
          );
        } else {
          return Center(
            child: Text('Something went wrong'),
          );
        }
      }),
    );
  }
}
