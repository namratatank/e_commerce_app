import 'package:e_commerce_app/blocs/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if(state is CartLoaded){
          return Column(
            children: [
              const Divider(thickness: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'SUBTOTAL',
                    style: TextStyle(fontSize: 13),
                  ),
                  Text(
                    '\u{20B9} ${state.cartModel.subTotalString}',
                    style: TextStyle(fontSize: 13),
                  )
                ],
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'DELIVERY FEE',
                    style: TextStyle(fontSize: 13),
                  ),
                  Text(
                    state.cartModel.deliveryFeeString,
                    style: const TextStyle(fontSize: 13),
                  )
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 50,
                color: Colors.grey,
                child: Container(
                  height: 50,
                  margin: const EdgeInsets.all(5),
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'TOTAL',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          state.cartModel.totalString,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        }else{
        return  Text('Something went wrong');
        }
      },
    );
  }
}
