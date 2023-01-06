import 'package:e_commerce_app/widgets/product_card.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';

class ProductCarousel extends StatelessWidget {
  final List<ProductModel> products;
  final bool? isProductInWishlist;
  const ProductCarousel({Key? key, required this.products, this.isProductInWishlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 10),
          child: ProductCard(
            productModel: products[index],
            leftPosition: 8,
            isProductInWishlist: isProductInWishlist,
          ),
        ),
      ),
    );
  }
}
