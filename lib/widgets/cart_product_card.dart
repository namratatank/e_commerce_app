import 'package:e_commerce_app/blocs/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/product_model.dart';

class CartProductCard extends StatelessWidget {
  final ProductModel productModel;
  final int quantity;

  const CartProductCard(
      {Key? key, required this.productModel, required this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Image.network(
            productModel.imageUrl!,
            height: 80,
            width: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${productModel.name}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text('\u{20B9} ${productModel.price}')
              ],
            ),
          ),
          BlocBuilder<CartBloc, CartState>(builder: (context, state) {
            return Row(
              children: [
                IconButton(
                    onPressed: () {
                      context.read<CartBloc>().add(
                            RemoveProductFromCart(product: productModel),
                          );
                    },
                    icon: Icon(Icons.remove_circle)),
                Text('$quantity'),
                IconButton(
                    onPressed: () {
                      context.read<CartBloc>().add(
                            AddProductToCart(product: productModel),
                          );
                    },
                    icon: Icon(Icons.add_circle)),
              ],
            );
          })
        ],
      ),
    );
  }
}
