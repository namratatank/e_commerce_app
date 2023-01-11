import 'package:e_commerce_app/models/models.dart';
import 'package:e_commerce_app/pages/dashboard.dart';
import 'package:e_commerce_app/widgets/OrderDetailProductCard.dart';
import 'package:e_commerce_app/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/widgets/order_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../blocs/cart/cart_bloc.dart';
import '../widgets/navigation_button.dart';

class OrderConfirmation extends StatelessWidget {
  const OrderConfirmation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: 'Order Confirmation',
        backArrowColor: Colors.white,
        favoriteIconColor: Colors.white,
        onBackPress: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (builder) => Dashboard()));
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: NavigationButton(
            title: 'BACK TO SHOPPING',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => Dashboard()));
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.black,
                ),
                Positioned(
                  left: (MediaQuery.of(context).size.width - 100) / 2,
                  top: 125,
                  child: SvgPicture.asset(
                    'assets/images/order.svg',
                  ),
                ),
                Positioned(
                    top: 250,
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Your order is completed',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi, Namrata',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  const Text('Thankyou for purchasing on Foodie'),
                  const SizedBox(height: 20),
                  Text(
                    'Order code: 123456789',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const OrderSummary(),
                  const SizedBox(height: 20),
                  const Text(
                    'Order Details',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const Divider(thickness: 2),
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      if (state is CartLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is CartLoaded) {
                        return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemCount: state.cartModel
                                .productQuantity(state.cartModel.products)
                                .keys
                                .length,
                            itemBuilder: (context, index) {
                              return OrderDetailProductCard(
                                product: state.cartModel
                                    .productQuantity(state.cartModel.products)
                                    .keys
                                    .elementAt(index),
                                quantity: state.cartModel
                                    .productQuantity(state.cartModel.products)
                                    .values
                                    .elementAt(index),
                              );
                            });
                      } else {
                        return const Center(
                          child: Text('Something went wrong'),
                        );
                      }
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
