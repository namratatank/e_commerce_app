import 'package:flutter/cupertino.dart';

import '../models/product_model.dart';

class OrderDetailProductCard extends StatelessWidget {
  final ProductModel product;
  final int quantity;
  const OrderDetailProductCard({Key? key, required this.product, required this.quantity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          product.imageUrl ?? '',
          height: 80,
          width: 100,
        ),
        SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name ?? '',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text('Quantity: $quantity')
            ],
          ),
        ),
        Expanded(
          child: Text(
            '\u{20B9} ${product.price.toString()}', textAlign: TextAlign.end,),)
      ],
    );
  }
}
